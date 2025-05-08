from django.urls import path
from trampoline_park.views import *
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Trampoline Park API",
        default_version='v1',
        description="Документация API для проекта",
    ),
    public=True,
    permission_classes=[permissions.AllowAny],
)

urlpatterns = [
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    path("api/user/", UserRetrieveApiView.as_view()),
    path("api/client/create/", ClientCreateAPIView.as_view()),
    path("api/client/list/", ClientListAPIView.as_view()),
    path("api/client/me/", CurrentClientRetrieveAPIView.as_view()),
    path("api/client/<int:pk>/", ClientRetrieveUpdateDestroyAPIView.as_view()),
    path("api/coach/me/", CurrentCoachRetrieveAPIView.as_view()),
    path("api/coach/list/", CoachListAPIView.as_view()),
    path("api/coach/<int:pk>/", CoachRetrieveUpdateAPIView.as_view()),
    path("api/coach/specialty/list/", CoachSpecialtyListAPIView.as_view()),
    path("api/coach/specialty/create/", CoachSpecialtyCreateAPIView.as_view()),
    path("api/coach/achievement/list/", CoachAchievementListAPIView.as_view()),
    path("api/coach/achievement/create/", CoachAchievementCreateAPIView.as_view()),
    path("api/workout_type/list/", WorkoutTypeAPIView.as_view()),
    path("api/workout_type/<int:pk>/", WorkoutTypeRetrieveAPIView.as_view()),
    path("api/workout/update/<int:pk>/", WorkoutUpdateAPIView.as_view()),
    path("api/workout/list/", WorkoutListAPIView.as_view()),
    path("api/client_workout/list/", ClientWorkoutListApiView.as_view()),
    path("api/workout/<int:pk>/", WorkoutRetrieveAPIView.as_view()),
    path("api/type_optional_service/list/", TypeOptionalServiceListAPIView.as_view()),
    path("api/optional_service/list/", OptionalServiceListAPIView.as_view()),
    path("api/coach_costume/list/", CoachCostumeListAPIView.as_view()),
    path("api/photo_video_price/<int:pk>/", PhotoVideoServicePriceApiView.as_view()),
    path("api/event/create/", EventCreateAPIView.as_view()),
    path("api/event/list/", EventListAPIView.as_view()),
    path("api/video_warm_up/<int:pk>/", VideoWarmUpRetrieveAPIView.as_view()),
    path("api/communication/list/", CommunicationListAPIView.as_view()),
]
