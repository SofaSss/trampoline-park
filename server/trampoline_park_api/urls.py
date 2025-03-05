
from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from trampoline_park.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/auth/", include("djoser.urls")),  # регистрация, получение списка пользователей, смена пароля и сброс пароля
    path("api/auth/", include("djoser.urls.jwt")),  # JWT-аутентификация (вход, обновление токена, верификация токена)
    path("api/clientcreate/", ClientCreateAPIView.as_view()),
    path("api/clientupdate/<int:pk>/", ClientAPIUpdate.as_view()),
    path("api/clientdelete/<int:pk>/", ClientAPIDelete.as_view()),

]
