from django.utils.dateparse import parse_datetime
from rest_framework import generics
from rest_framework.exceptions import ValidationError

from trampoline_park.serializers import *


class UserListApiView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class ClientCreateAPIView(generics.CreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientCreateSerializer


class ClientListAPIView(generics.ListAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer


class ClientRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer


class CoachListAPIView(generics.ListAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer


class CoachRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer


class WorkoutTypeAPIView(generics.ListAPIView):
    queryset = WorkoutType.objects.all()
    serializer_class = WorkoutTypeSerializer


class WorkoutCreateAPIView(generics.CreateAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer

    def perform_create(self, serializer):
        datetime = serializer.validated_data["datetime"]
        workout_type = serializer.validated_data["workout_type"]
        coach = serializer.validated_data["coach"]

        if Workout.objects.filter(datetime=datetime, workout_type=workout_type, coach=coach).exists():
            raise ValidationError("Такая тренировка уже существует.")

        serializer.save()


class WorkoutListAPIView(generics.ListAPIView):
    serializer_class = WorkoutSerializer

    def get_queryset(self):
        user = self.request.user
        queryset = Workout.objects.all()

        if user.role == 'COACH':
            queryset = queryset.filter(coach=user.coach)
        elif user.role == 'CLIENT':
            queryset = queryset.filter(clients=user.client)

        start_date = self.request.query_params.get("start_date")
        end_date = self.request.query_params.get("end_date")

        if start_date:
            queryset = queryset.filter(datetime__gte=parse_datetime(start_date))  # gte - >=
        if end_date:
            queryset = queryset.filter(datetime__lte=parse_datetime(end_date))  # lte - <=

        return queryset


class WorkoutRetrieveDestroyAPIView(generics.RetrieveDestroyAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
