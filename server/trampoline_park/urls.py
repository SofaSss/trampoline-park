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
    path("api/client/<int:pk>/", ClientRetrieveUpdateDestroyAPIView.as_view()),
    path("api/coach/list/", CoachListAPIView.as_view()),
    path("api/coach/<int:pk>/", CoachRetrieveUpdateAPIView.as_view()),
    path("api/workouttype/list/", WorkoutTypeAPIView.as_view()),
    path("api/workouttype/<int:pk>/", WorkoutTypeRetrieveAPIView.as_view()),
    path("api/workout/update/<int:pk>/", WorkoutUpdateAPIView.as_view()),
    path("api/workout/list/", WorkoutListAPIView.as_view()),
    path("api/workout/<int:pk>/", WorkoutRetrieveAPIView.as_view()),
    path("api/typeoptionalservice/list/", TypeOptionalServiceListAPIView.as_view()),
    path("api/optionalservice/list/", OptionalServiceListAPIView.as_view()),
    path("api/coachcostume/list/", CoachCostumeListAPIView.as_view()),
    path("api/photovideoprice/list/", PhotoVideoServicePriceApiView.as_view()),
    path("api/event/create/", EventCreateAPIView.as_view()),
    path("api/event/list/", EventListAPIView.as_view()),

]
