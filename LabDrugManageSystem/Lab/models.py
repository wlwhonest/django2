from django.db import models
from django.contrib.auth.models import User


# 实验室信息表
class Lab(models.Model):
    name = models.CharField('实验室名称', max_length=20)
    description = models.TextField('实验室简介', blank=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'lab'
        verbose_name = '实验室信息表'
        verbose_name_plural = verbose_name


# 药品信息表
class Medicine(models.Model):
    number = models.CharField('药品编号', max_length=13, unique=True)
    name = models.CharField('药品名', max_length=200)
    detail = models.TextField('药品信息', max_length=2000, blank=True)
    nowtotal = models.IntegerField('药品剩余量', default=0)
    usedtotal = models.IntegerField('药品用量', default=0)
    riskfactor = models.IntegerField('危险性（值越大越危险）', default=0)
    user_risk = models.IntegerField('使用风险度（值越大缺少时影响越大）', default=0)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'medicine'
        verbose_name = '药品信息表'
        verbose_name_plural = verbose_name
        ordering = ('number',)


# 仪器信息表
class Instrument(models.Model):
    ins_no = models.CharField('仪器编号', max_length=13, unique=True)
    ins_name = models.CharField('仪器名称', max_length=200)
    ins_detail = models.TextField('仪器信息', max_length=2000, blank=True)
    ins_nowtotal = models.IntegerField('仪器剩余数', default=0)
    ins_bototal = models.IntegerField('仪器借用数', default=0)

    def __str__(self):
        return self.ins_name

    class Meta:
        db_table = 'instrument'
        verbose_name = '仪器信息表'
        verbose_name_plural = verbose_name
        ordering = ('ins_no',)


# 学生信息表
class CommonUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nickyName = models.CharField('昵称', blank=True, max_length=50)
    cate = models.BooleanField('是否学生', default=False)
    faculty = models.CharField('系别', max_length=20, blank=True, default='undefine')

    class Meta:
        db_table = 'common_user'
        verbose_name = '学生信息表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.user)


# 借用药品记录表
class Borrow(models.Model):
    user = models.ForeignKey(CommonUser, on_delete=models.CASCADE, verbose_name='借用人')
    lab = models.ForeignKey(Lab, on_delete=models.CASCADE, verbose_name='实验室')
    medicine = models.ForeignKey(Medicine, on_delete=models.CASCADE, verbose_name='借用药品', )
    medicineUsedNum = models.PositiveIntegerField('药品使用量(/g或/ml)', default=0)
    boDate = models.DateTimeField('借用时间', auto_now_add=True)

    class Meta:
        db_table = 'borrow'
        verbose_name = '借用药品记录表'
        verbose_name_plural = verbose_name


# 借用仪器纪录表
class InsBorrow(models.Model):
    ins_user = models.ForeignKey(CommonUser, on_delete=models.CASCADE, verbose_name='借用人')
    instrument = models.ForeignKey(Instrument, on_delete=models.CASCADE, verbose_name='借用仪器', )
    ins_boNum = models.PositiveIntegerField('借用数量', default=0)
    ins_boDate = models.DateTimeField('借用时间', auto_now_add=True)
    ins_tuData = models.CharField('归还时间', max_length=100, default="暂未归还")

    class Meta:
        db_table = 'ins_borrow'
        verbose_name = '借用仪器记录'
        verbose_name_plural = verbose_name


# 文件信息表
class Doc(models.Model):
    file_name = models.CharField('文件名字', max_length=50)
    file_obj = models.FileField('文件', upload_to='files/')
    upload_time = models.DateTimeField('上传时间', auto_now_add=True)

    def __str__(self):
        return self.file_name

    class Meta:
        db_table = 'doc'
        verbose_name = '文件信息表'
        verbose_name_plural = verbose_name
