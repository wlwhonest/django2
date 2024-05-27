from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User


# 用户注册表单
class UserCustomRegister(UserCreationForm):
    nickyName = forms.CharField(required=False, max_length=50)
    cate = forms.BooleanField(required=True)
    faculty = forms.CharField(required=True, max_length=20)

    class Meta:
        model = User
        fields = ('username', 'password1', 'password2', 'email',
                  'nickyName', 'cate', 'faculty')


# 用户修改信息表单
class UserCustomChange(UserChangeForm):
    nickyName = forms.CharField(required=False, max_length=50)

    class Meta:
        model = User
        fields = ('email', 'password', 'nickyName')
