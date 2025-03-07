from django.contrib import admin
from django.urls import path, include

from trampoline_park.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/auth/", include("djoser.urls")),
    # регистрация, получение списка пользователей, смена пароля и сброс пароля
    path("api/auth/", include("djoser.urls.jwt")),  # JWT-аутентификация (вход, обновление токена, верификация токена)
    # http://127.0.0.1:8000/api/auth/jwt/create/

    path('', include('trampoline_park.urls')),

]
