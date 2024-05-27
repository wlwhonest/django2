import os
from pathlib import Path

# 项目路径
BASE_DIR = Path(__file__).resolve().parent.parent

# 项目秘钥
SECRET_KEY = '2023-k0x$88f=-m=8888tv)vasdffff^e=sdfsad@ch#&r+bhml'

# 调试模式
DEBUG = True

# 限定请求主机
ALLOWED_HOSTS = ['*']

# 注册app
INSTALLED_APPS = [
    'simpleui',  # 后台界面样式
    'import_export',  # 文件导入导出
    'django.contrib.admin',  # 后台管理系统
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'Lab',  # 实验室药品管理系统
]

# 中间件
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# 根路由
ROOT_URLCONF = 'LabDrugManageSystem.urls'

# 前端模板文件配置
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'LabDrugManageSystem.wsgi.application'

# 数据库配置
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'lab_drug',
        'HOST': '127.0.0.1',
        'PORT': '3306',
        'USER': 'root',
        'PASSWORD': 'WJSWjdyd@550'
    }
}

# 密码验证
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# 国际化配置
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True
USE_L10N = True

# 推荐使用USE_TZ = True,让数据库存储0时区时间
USE_TZ = True

# 静态文件配置 (CSS, JavaScript, Images)
STATIC_URL = '/static/'
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, "static"),
)

# 媒体文件配置
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# simpleui 设置

# 首页显示服务器、python、django、simpleui相关信息
SIMPLEUI_HOME_INFO = False

# 首页显示快速操作
# SIMPLEUI_HOME_QUICK = False

# 首页显示最近动作
# SIMPLEUI_HOME_ACTION = False

# 自定义SIMPLEUI的Logo
# SIMPLEUI_LOGO = 'https://avatars2.githubusercontent.com/u/13655483?s=60&v=4'

# 登录页粒子动画，默认开启，False关闭
# SIMPLEUI_LOGIN_PARTICLES = False

# 让simpleui 不要收集相关信息
SIMPLEUI_ANALYSIS = True

# 自定义simpleui 菜单
SIMPLEUI_CONFIG = {
    # 在自定义菜单的基础上保留系统模块
    'system_keep': True,
    'menus': [{
        'name': '可视化',
        'icon': 'fas fa-code',
        'models': [{
            'name': '总览',
            'url': 'chart1',
            'icon': 'fa fa-bars'
        }, {
            'name': '近一月',
            'url': 'chart2',
            'icon': 'fa fa-graduation-cap'
        }, {
            'name': '预警页面',
            'url': 'predict',
            'icon': 'fa fa-exclamation-circle'
        }]
    }]
}

# 是否显示默认图标，默认=True
# SIMPLEUI_DEFAULT_ICON = False

# 图标设置，图标参考：
# SIMPLEUI_ICON = {
#     '系统管理': 'fab fa-apple',
#     '员工管理': 'fas fa-user-tie'
# }

# 指定simpleui 是否以脱机模式加载静态资源，为True的时候将默认从本地读取所有资源，即使没有联网一样可以渲染界面。适合内网项目
# 不填该项或者为False的时候，默认从第三方的cdn获取
# SIMPLEUI_STATIC_OFFLINE = True
