from django.conf import settings
from django.conf.urls import include
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path

import Lab.urls

urlpatterns = [
                  path('admin/', admin.site.urls),  # 后台管理
                  path('', include(Lab.urls)),  # 系统管理
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) + \
              static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
