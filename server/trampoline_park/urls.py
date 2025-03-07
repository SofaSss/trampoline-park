from collections import UserList

from django.urls import path

from trampoline_park.views import *

urlpatterns = [
    path("api/users/list/", UserListApiView.as_view()),
    path("api/client/create/", ClientCreateAPIView.as_view()),
    path("api/client/list/", ClientListAPIView.as_view()),
    path("api/client/<int:pk>/", ClientRetrieveUpdateDestroyAPIView.as_view()),
    path("api/coach/list/", CoachListAPIView.as_view()),
    path("api/coach/<int:pk>/", CoachRetrieveUpdateDestroyAPIView.as_view()),
    path("api/workouttype/list/", WorkoutTypeAPIView.as_view()),

]
