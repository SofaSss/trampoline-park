
from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from trampoline_park.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/auth/", include("djoser.urls")),  # регистрация, получение списка пользователей, смена пароля и сброс пароля
    path("api/auth/", include("djoser.urls.jwt")),  # JWT-аутентификация (вход, обновление токена, верификация токена)
    path("api/client/create/", ClientCreateAPIView.as_view()),
    path("api/client/update/<int:pk>/", ClientAPIUpdate.as_view()),
    path("api/client/delete/<int:pk>/", ClientAPIDelete.as_view()),
    path("api/coach/view/", CoachAPIView.as_view()),
    path("api/coach/update/<int:pk>/", CoachAPIUpdate.as_view()),
    path("api/coach/delete/<int:pk>/", CoachAPIDelete.as_view()),
    path("api/workouttype/view/", WorkoutTypeAPIView.as_view()),

]
