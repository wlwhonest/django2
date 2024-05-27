from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from import_export import resources
from import_export.admin import ImportExportActionModelAdmin
from simpleui.admin import AjaxAdmin

from .models import *


# 药品信息表导入导出文件配置
class ProxyResource(resources.ModelResource):
    class Meta:
        model = Medicine
        import_id_fields = ('number',)
        fields = ('id', 'number', 'name', 'nowtotal', 'usedtotal', 'riskfactor', 'detail', 'user_risk')
        export_order = ('id', 'number', 'name', 'nowtotal', 'usedtotal', 'riskfactor', 'detail')


# 药品信息配置
class MedicineAdmin(ImportExportActionModelAdmin, AjaxAdmin):
    resource_class = ProxyResource
    list_display = ['id', 'number', 'name', 'nowtotal', 'usedtotal', 'riskfactor', 'user_risk']
    list_editable = ['nowtotal', 'usedtotal', 'riskfactor', 'user_risk']
    list_per_page = 10
    list_filter = ['riskfactor', 'user_risk']
    list_display_links = ['name', ]
    search_fields = ['number', 'name', 'riskfactor', 'user_risk']


# 借用药品信息表导入导出配置
class ProxyBorrow(resources.ModelResource):
    class Meta:
        model = Borrow
        import_id_fields = ('user', 'boDate')
        fields = ('id', 'user', 'lab', 'medicine', 'medicineUsedNum', 'boDate',)
        export_order = ('id', 'user', 'lab', 'medicine', 'medicineUsedNum', 'boDate')


# 借用药品信息表配置
class BorrowAdmin(ImportExportActionModelAdmin, AjaxAdmin):
    resource_class = ProxyBorrow
    list_display = ['id', 'user', 'medicine', 'medicineUsedNum', 'boDate']
    list_filter = ['boDate', 'user', ]
    list_display_links = ['user', ]
    list_per_page = 10


#  TabularInline，方便在 Django Admin 中管理父子模型之间的关系
class CommonUserInline(admin.TabularInline):
    model = CommonUser
    can_delete = False
    verbose_name = '用户信息表'
    verbose_name_plural = verbose_name


#  Django Admin 后台编辑 User 对象时，将在同一个页面上显示和编辑相关的多个 CommonUser
class UserAdmin(BaseUserAdmin):
    inlines = (CommonUserInline,)


# 实验室信息表配置
class LabAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'description']
    list_per_page = 10
    ordering = ['id']


# 仪器信息表配置
class InstrumentAdmin(admin.ModelAdmin):
    list_display = ['id', 'ins_no', 'ins_name', 'ins_nowtotal', 'ins_bototal', 'ins_detail']
    list_per_page = 5
    ordering = ['ins_no']


# 仪器借用信息表配置
class InsBorrowAdmin(admin.ModelAdmin):
    list_display = ['id', 'ins_user', 'instrument', 'ins_boNum', 'ins_boDate', 'ins_tuData']
    list_per_page = 5
    ordering = ['-ins_boDate']


# 文件信息表配置
class DocAdmin(admin.ModelAdmin):
    list_display = ['id', 'file_name', 'file_obj', 'upload_time']
    list_per_page = 5
    ordering = ['-upload_time']


# 注册模型到后台管理系统
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Medicine, MedicineAdmin)
admin.site.register(Borrow, BorrowAdmin)
admin.site.register(Lab, LabAdmin)
admin.site.register(Instrument, InstrumentAdmin)
admin.site.register(InsBorrow, InsBorrowAdmin)
admin.site.register(Doc, DocAdmin)

admin.site.site_header = 'Django实验室药品分析管理系统'
admin.site.site_title = 'Django实验室药品分析管理系统后台'
