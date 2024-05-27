from django.urls import path

from . import views

app_name = 'Lab'

urlpatterns = [
    # 学生端
    path('', views.loginOfAll, name='loginOfAll'),  # 总登录页面
    path('index', views.index, name='index'),  # 学生首页
    path('ins_index', views.ins_index, name='ins_index'),  # 仪器首页
    path('lab', views.lab, name='lab'),  # 实验室信息
    path('browseHistory', views.borrowHistory, name='borrowHistory'),  # 药品借用历史记录
    path('ins_browseHistory', views.borrowInsHistory, name='borrowInsHistory'),  # 仪器借用历史记录
    path('userCentre', views.userCentre, name='userCentre'),  # 用户中心
    path('changePassword', views.changePassword, name='changePassword'),  # 修改密码
    path('about', views.about, name='about'),  # 关于
    path('subAndBo/<int:medicine_id>', views.subAndBo, name='subAndBo'),  # 借用药品
    path('ins_subAndBo/<int:ins_id>', views.ins_subAndBo, name='ins_subAndBo'),  # 借用仪器
    path('ins_addAndTu/<int:bor_id>', views.ins_addAndTu, name='ins_addAndTu'),  # 借用仪器
    path('login/', views.loging, name='login'),  # 登录
    path('logout/', views.logouting, name='logout'),  # 退出登录
    path('register/', views.register, name='register'),  # 注册
    path('detail/<int:medicineId>', views.medicineDetail, name='medicineDetail'),  # 药品详情
    path('medicineSearch/', views.medicineSearch, name='medicineSearch'),  # 药品搜索
    path('user_info/', views.userInfo, name='userInfo'),  # 用户信息
    path('download_file/<int:doc_id>', views.download_file, name='download_file'),  # 下载文件

    # 后台管理系统的三个分析图表
    path('admin/chart1/', views.chart1, name='chart1'),
    path('admin/chart2/', views.chart2, name='chart2'),
    path('admin/predict/', views.predict, name='predict'),
]
