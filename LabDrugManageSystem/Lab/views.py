import datetime
import json

import requests
from dateutil.relativedelta import relativedelta
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.core.paginator import Paginator, PageNotAnInteger, InvalidPage, EmptyPage
from django.db import connection
from django.db.models import Q, Count
from django.http import HttpResponse, FileResponse
from django.shortcuts import render, redirect
from django.utils.encoding import escape_uri_path

from .forms import UserCustomRegister, UserCustomChange
from .models import *


# 总的登录界面
def loginOfAll(request):
    return render(request, 'loginOfAll.html')


# 首页，显示药品列表
def index(request):
    if request.method == 'GET':
        MedicineList = Medicine.objects.all()
        LabList = Lab.objects.all()
        # 将数据按照规定每页显示 8 条, 进行分割
        paginator = Paginator(MedicineList, 8)
        # 分页获取 url 后面的 page 参数的值, 首页不显示 page 参数, 默认值是 1
        page = request.GET.get('page')
        medicineList = paginator.get_page(page)
        content = {
            'medicineList': medicineList,  # 药品信息
            'LabList': LabList,  # 实验室信息
            'currentUser': request.user,  # 用户信息
        }
        return render(request, 'index.html', content)


# 实验室列表信息
def lab(request):
    LabList = Lab.objects.all()
    # 分页显示，将数据按照规定每页显示 8 条, 进行分割
    paginator = Paginator(LabList, 8)
    # 获取 url 后面的 page 参数的值, 首页不显示 page 参数, 默认值是 1
    page = request.GET.get('page')
    try:
        labList = paginator.page(page)
    except PageNotAnInteger:
        # 如果请求的页数不是整数, 返回第一页。
        labList = paginator.page(1)
    except EmptyPage:
        # 如果请求的页数不在合法的页数范围内，返回结果的最后一页。
        labList = paginator.page(paginator.num_pages)
    except InvalidPage:
        # 如果请求的页数不存在, 重定向页面
        return HttpResponse('找不到页面的内容！')
    content = {
        'labList': labList,  # 实验室信息
    }
    return render(request, 'lab.html', content)


# 关于界面，只接受get请求
def about(request):
    if request.method == 'GET':
        docList = Doc.objects.all()  # 文件信息
        return render(request, 'about.html', locals())


# 搜索药品信息
def medicineSearch(request):
    LabList = Lab.objects.all()  # 实验室信息
    if request.method == 'POST':
        searchType = request.POST['searchType']  # 按照什么搜索
        keyword = request.POST['keyword']  # 搜索内容
        # 按照名字搜索
        if searchType == 'name':
            MedicineList = Medicine.objects.filter(name__contains=keyword)
        # 按照编号搜索
        elif searchType == 'number':
            MedicineList = Medicine.objects.filter(number__contains=keyword)
        # 按照全部搜索
        else:
            MedicineList = Medicine.objects.filter(Q(name__contains=keyword) |
                                                   Q(number__contains=keyword))
        # 将数据按照规定每页显示 8 条, 进行分割
        paginator = Paginator(MedicineList, 8)
        # 获取 url 后面的 page 参数的值, 首页不显示 page 参数, 默认值是 1
        page = request.GET.get('page')
        # 分页后的数据
        medicineList = paginator.get_page(page)
        content = {'medicineList': medicineList,
                   'LabList': LabList,
                   'currentUser': request.user
                   }
        return render(request, 'index.html', content)


# 登陆
def loging(request):
    if request.method == 'POST':
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'login.html', {'error': '用户不存在或密码错误，请检查！'})
        else:
            login(request, user)
            return redirect('Lab:index')
    else:
        return render(request, 'login.html')


# 退出登录
def logouting(request):
    logout(request)
    return redirect('Lab:index')


# 注册
def register(request):
    if request.method == 'POST':
        registerForm = UserCustomRegister(request.POST)
        if registerForm.is_valid():
            registerForm.save()
            newUser = authenticate(username=registerForm.cleaned_data['username'],
                                   password=registerForm.cleaned_data['password1'])
            newUser.email = registerForm.cleaned_data['email']
            CommonUser(user=newUser, nickyName=registerForm.cleaned_data['nickyName'],
                       cate=registerForm.cleaned_data['cate'],
                       faculty=registerForm.cleaned_data['faculty']).save()
            login(request, newUser)
            return redirect('Lab:index')
    else:
        registerForm = UserCustomRegister()
    content = {'registerForm': registerForm}
    return render(request, 'register.html', content)


# 用户查看个人信息，需要先登录
@login_required(login_url='Lab:login')
def userCentre(request):
    # 修改个人信息
    if request.method == 'POST':
        changeForm = UserCustomChange(request.POST, instance=request.user)
        if changeForm.is_valid():
            changeForm.save()
            request.user.commonuser.nickyName = changeForm.cleaned_data['nickyName']
            request.user.commonuser.save()
    else:
        pass
    changeForm = UserCustomChange()
    content = {'currentUser': request.user, 'changeForm': changeForm}
    return render(request, 'userCentre.html', content)


# 用户修改密码
@login_required(login_url='Lab:login')
def changePassword(request):
    if request.method == 'POST':
        changepasswordForm = PasswordChangeForm(data=request.POST, user=request.user)
        if changepasswordForm.is_valid():
            changepasswordForm.save()
            return redirect('Lab:login')
    else:
        pass
    changepasswordForm = PasswordChangeForm(user=request.user)
    content = {
        'currentUser': request.user,
        'changepasswordForm': changepasswordForm
    }
    return render(request, 'changePassword.html', content)


# 学生借用药品历史查看
@login_required(login_url='Lab:login')
def borrowHistory(request):
    if request.method == 'GET':
        user = CommonUser.objects.filter(user=request.user).first()
        MedicineListTarget = Borrow.objects.filter(user=user).order_by("-boDate")
        MedicineList = []
        for borrowInfo in MedicineListTarget:
            borrowTime = datetime.datetime.now().day - borrowInfo.boDate.day  # 已经借用的天数
            MedicineList.append((Medicine.objects.get(pk=borrowInfo.medicine_id), borrowInfo, borrowTime))
        content = {
            'MedicineList': MedicineList,
            'currentUser': request.user
        }
        return render(request, 'borrowHistory.html', content)


# 药品详情
def medicineDetail(request, medicineId):
    if request.method == 'GET':
        thisMedicine = Medicine.objects.get(id=medicineId)
        content = {
            'medicine': thisMedicine,
        }
        return render(request, 'detail.html', content)


# 借用药品
@login_required(login_url='Lab:login')
def subAndBo(request, medicine_id):
    if request.method == 'POST':
        thisLab = request.POST.get('lab')  # 借用的实验室
        thisNum = int(request.POST.get('medicineUsedNum'))  # 药品编号
        thisUser = User.objects.get(pk=request.user.id)  # 取用用户
        # p判断实验室是否存在
        labTrue = Lab.objects.filter(name__exact=thisLab).count()
        thisMedicine = Medicine.objects.get(pk=medicine_id)
        # 取用的数量大于库存数量
        if thisMedicine.nowtotal <= thisNum:
            return render(request, 'error.html', {"failInfo": "借用失败！库存不足啦！"})
        # 不存在填写的实验室名称
        elif labTrue == 0:
            return render(request, 'error.html', {"failInfo": "您输入的实验室不存在！"})
        # 满足条件可以取用
        else:
            thisMedicine.usedtotal += thisNum
            thisMedicine.nowtotal -= thisNum
            thisMedicine.save()
            newBorrow = Borrow(user=thisUser.commonuser, lab=Lab.objects.get(name=thisLab),
                               medicine=thisMedicine, medicineUsedNum=thisNum)
            newBorrow.save()
            return redirect('Lab:index')


# 用户信息界面
def userInfo(request):
    return render(request, 'usr_info.html')


# 仪器列表
def ins_index(request):
    if request.method == 'GET':
        InstrumentList = Instrument.objects.all()
        # 将数据按照规定每页显示 8 条, 进行分割
        paginator = Paginator(InstrumentList, 8)
        # 获取 url 后面的 page 参数的值, 首页不显示 page 参数, 默认值是 1
        page = request.GET.get('page')
        instrumentList = paginator.get_page(page)
        content = {
            'instrumentList': instrumentList,
            'currentUser': request.user,
        }
        return render(request, 'ins_index.html', content)


# 仪器借用
@login_required(login_url='Lab:login')
def ins_subAndBo(request, ins_id):
    if request.method == 'POST':
        thisNum = int(request.POST.get('insUsedNum'))  # 仪器数量
        thisUser = User.objects.get(pk=request.user.id)  # 借用的用户
        thisInstrument = Instrument.objects.get(pk=ins_id)  # 仪器信息
        # 借用数量超过了库存数量
        if thisInstrument.ins_nowtotal <= thisNum:
            return render(request, 'error.html', {"failInfo": "借用失败！库存不足！"})
        # 满足借用条件
        else:
            thisInstrument.ins_bototal += thisNum  # 借出数量增加
            thisInstrument.ins_nowtotal -= thisNum  # 剩余量减少
            thisInstrument.save()
            newBorrow = InsBorrow(ins_user=thisUser.commonuser,
                                  instrument=thisInstrument, ins_boNum=thisNum)
            newBorrow.save()
            return redirect('Lab:ins_index')


# 仪器归还
@login_required(login_url='Lab:login')
def ins_addAndTu(request, bor_id):
    if request.method == 'POST':
        thisNum = int(request.POST.get('insTurnedNum'))  # 仪器归还数量
        thisUser = User.objects.get(pk=request.user.id)  # 借用的用户
        thisInsbro = InsBorrow.objects.get(pk=bor_id)  # 借用信息
        print(thisInsbro.instrument_id)
        thisInstrument = Instrument.objects.get(pk=thisInsbro.instrument_id)  # 仪器信息
        print(thisNum, thisInsbro.ins_boNum)

        # 归还数量大于借用的数量
        if thisInsbro.ins_boNum < thisNum:
            return render(request, 'error.html', {"failInfo": "归还失败！归还数量有误！"})

        # 归还部分数量
        elif thisInsbro.ins_boNum > thisNum:
            thisInstrument.ins_bototal -= thisNum  # 借出数量减少
            thisInstrument.ins_nowtotal += thisNum  # 剩余量增加
            thisInstrument.save()
            thisInsbro.ins_boNum -= thisNum
            thisInsbro.save()
            return redirect('Lab:borrowInsHistory')
        # 全部归还
        else:
            thisInstrument.ins_bototal -= thisNum  # 借出数量减少
            thisInstrument.ins_nowtotal += thisNum  # 剩余量增加
            thisInstrument.save()
            # 借用数量归0
            thisInsbro.ins_boNum = 0
            now = datetime.datetime.now()
            str_now = now.strftime("%Y-%m-%d %H:%M:%S")
            thisInsbro.ins_tuData = str_now
            thisInsbro.save()
            return redirect('Lab:borrowInsHistory')


# 用户仪器借用历史记录
@login_required(login_url='Lab:login')
def borrowInsHistory(request):
    if request.method == 'GET':
        user = CommonUser.objects.filter(user=request.user).first()
        InstrumentListTarget = InsBorrow.objects.filter(ins_user=user).order_by("-ins_boDate")  # 按照借用时间排序
        InstrumentList = []
        for borrowInfo in InstrumentListTarget:
            borrowTime = datetime.datetime.now().day - borrowInfo.ins_boDate.day
            InstrumentList.append((Instrument.objects.get(pk=borrowInfo.instrument.id), borrowInfo, borrowTime))
        content = {
            'InstrumentList': InstrumentList,
            'currentUser': request.user
        }
        return render(request, 'ins_borrowHistory.html', content)


# 文件资料下载
def download_file(request, doc_id):
    # 获取资料信息用户显示
    if request.method == 'GET':
        file_result = Doc.objects.filter(id=doc_id)
        if file_result:
            file = list(file_result)[0]
            ip = 'http://127.0.0.1:8000/media/'
            path = ip + str(file.file_obj)

            # 下载资料
            try:
                response = FileResponse(requests.get(path, stream=True))
            except requests.exceptions.ConnectionError as e:
                response.status_code = '链接请求失败'
            file_ext = path.split(".")[-1]
            if not file_ext:
                pass
            else:
                file_ext = file_ext.lower()
            response['Content-Type'] = 'application/octet-stream'
            FileName = escape_uri_path(path).split('/')[-1]
            response['Content-Disposition'] = 'attachment;filename="{0}"'.format(FileName)
            return response
        else:
            return HttpResponse("文件不存在")


# 可视化1：总览信息图表
def chart1(request):
    chartMedicine = Medicine.objects.all()  # 取用数据进行分析
    name_list = []  # 存储药品名称列表
    used_list = []  # 存储药品已用数据列表
    now_list = []  # 存储药品剩余量数据列表

    for medicine in chartMedicine:
        name_list.append(medicine.name)
        used_list.append(medicine.usedtotal)
        now_list.append(medicine.nowtotal)

    # 对每天取用数据进行计数
    chartBorrow = Borrow.objects.extra({'boDate': "date(boDate)"}).values_list('boDate').annotate(count=Count('id'))
    bo_list = []  # 存储取用时间列表
    count_list = []
    for bo in chartBorrow:
        bo_list.append(bo[0].strftime('%Y-%m-%d'))
        count_list.append(bo[1])

    # 封装数据
    content = {
        'name_list': name_list,  # 药品名称
        'used_list': used_list,  # 已用数据
        'now_list': now_list,  # 剩余数据
        'bo_list': bo_list,  # 取用时间
        'count_list': count_list  # 取用次数列表
    }
    return render(request, 'chart1.html', content)


# 可视化2：近一月取用情况图表
def chart2(request):
    today = datetime.datetime.now()
    lastmonth = (datetime.datetime.now() - relativedelta(months=1))  # 近一月的时间段
    cursor = connection.cursor()
    # 查询近一月借用数量最多的药品的数量前五
    sql1 = "select sum(medicineUsedNum) totalUsed, medicine_id, name " \
           "from borrow,medicine " \
           "where borrow.medicine_id=medicine.id and boDate between %s and %s " \
           "group by medicine_id order by totalUsed limit 5"

    # 查询数据，封装数据
    cursor.execute(sql1, [lastmonth, today])
    ret1 = cursor.fetchall()
    name_list = []  # 药品名称列表
    used_list = []  # 已用数量列表
    for i in ret1:
        name_list.append(i[2])
        used_list.append(int(i[0]))

    # 统计用户的药品借用次数前五
    cursor = connection.cursor()
    sql2 = "select  nickyName,count(*) record " \
           "from borrow,common_user where borrow.user_id = common_user.id " \
           "and boDate between %s and %s " \
           "group by borrow.user_id order by record limit 5"
    cursor.execute(sql2, [lastmonth, today])
    ret2 = cursor.fetchall()
    cursor.close()
    user_list = []  # 用户列表
    count_list = []  # 借用次数列表
    for i in ret2:
        user_list.append(i[0])
        count_list.append(i[1])

    # 封装为字典数据
    data = {}
    # keys与values分别为该数据的键数组，值的数组。使用循环为字典添加对应键值
    for k, v in zip(user_list, count_list):
        data.update({k: v, }, )
    # 最后将数据打包成json格式以字典的方式传送到前端
    context = {
        'name_list': name_list,
        'used_list': used_list,
        'data': json.dumps(data),
    }
    return render(request, 'chart2.html', context)


# 导入pandas数据分析库
import pandas as pd


# 查询两个时间段之间的药品借用数据方法
def getData(time1, time2):
    cursor = connection.cursor()
    sql1 = ''' select  name ,sum(medicineUsedNum)  from borrow, medicine 
    where borrow.medicine_id=medicine.id and boDate between %s and %s group by medicine.id'''
    cursor.execute(sql1, [time1, time2])
    data4 = cursor.fetchall()
    data4 = pd.DataFrame(list(data4), columns=['药品', '使用量'])
    cursor.close()
    return data4  # 返回表格数据


# 查询近一月有借用纪录的药品的名字和使用风险度
def getRisk():
    cursor = connection.cursor()
    lastmonth = (datetime.datetime.now() - relativedelta(months=1))
    sql = ''' select distinct name, user_risk from borrow, medicine 
    where borrow.medicine_id=medicine.id and boDate>=%s '''
    cursor.execute(sql, lastmonth)
    data = cursor.fetchall()
    data = pd.DataFrame(list(data), columns=['药品', '使用风险度'])
    cursor.close()
    return data


# 添加浮点数计算模块
from decimal import Decimal


# 可视化3：系统预警
def predict(request):
    if request.method == 'GET':
        # ---------------------------使用情况--------------------------
        today = datetime.datetime.now()
        lastweek1 = (datetime.datetime.now() - relativedelta(weeks=1))  # 近一周
        lastweek2 = (datetime.datetime.now() - relativedelta(weeks=2))  # 近两周
        lastweek3 = (datetime.datetime.now() - relativedelta(weeks=3))  # 近三周
        lastmonth = (datetime.datetime.now() - relativedelta(months=1))  # 近一月
        # 获取最近几周的药品取用数据
        df1 = getData(lastweek1, today)
        df2 = getData(lastweek2, lastweek1)
        df3 = getData(lastweek3, lastweek2)
        df4 = getData(lastmonth, lastweek3)
        # print("df1:", df1)

        # merge方法实现数据合并
        df_merge = pd.merge(df1, df2, on='药品', how='outer')
        print("df_merge:", df_merge)
        df_merge = pd.merge(df_merge, df3, on='药品', how='outer')
        df_merge = pd.merge(df_merge, df4, on='药品', how='outer')
        df_merge.columns = ['药品', '1', '2', '3', '4']
        df_merge.fillna(0, inplace=True)
        print("df_merge:", df_merge)

        # 为每一周的使用量设置不同权重，计算下周预计使用量
        def sumweight(a, b, c, d):
            # Decimal类型from_float()方法可以将浮点数转换为十进制数,quantize方法实现四舍五入
            return Decimal.from_float(
                float(a) * (0.4) + float(b) * (0.3) + float(c) * (0.2) + float(d) * (0.1)).quantize(Decimal('0.00'))

        df_merge['res'] = df_merge.apply(lambda x: sumweight(x['1'], x['2'], x['3'], x['4']), axis=1)
        print('res', df_merge['res'])

        df_merge['1'] = df_merge['1'].astype('float')
        df_merge['2'] = df_merge['2'].astype('float')
        df_merge['3'] = df_merge['3'].astype('float')
        df_merge['4'] = df_merge['4'].astype('float')
        df_merge['res'] = df_merge['res'].astype('float')

        # 接收
        df_1 = getRisk()
        df_2 = pd.DataFrame()
        df_2['药品'] = df_merge['药品']
        df_2['res'] = df_merge['res']
        df_r = pd.merge(df_1, df_2, on='药品', how='outer')
        print("df_r:", df_r)

        # 判断药品预警信息
        def judge(x1, x2):
            factor = x1 * x2
            if factor > 200:
                return "危险"
            elif factor < 100:
                return "安全"
            else:
                return "风险"

        df_r['level'] = df_r.apply(lambda x: judge(x['res'], x['使用风险度']), axis=1)
        result_x = df_merge.values.tolist()
        result_x.insert(0, ['药品', '近1周', '近2周~近1周', '近3周~近2周', '近4周~近3周', '预测下周使用量'])
        name_list = []  # 药品列表
        level_list = []  # 预警等级列表
        for i in range(0, len(df_r)):
            name_list.append(df_r.iloc[i]['药品'])
            level_list.append(df_r.iloc[i]['level'])
        fianl = dict(zip(name_list, level_list))
        context = {
            'fianl_list': fianl,  # 预警结果
            'result_x': result_x  # 使用趋势数据
        }
        print('final:', fianl)
        print('result_x:', result_x)
        return render(request, 'predict.html', context)
