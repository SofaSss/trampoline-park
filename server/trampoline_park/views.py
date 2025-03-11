from django.template.defaulttags import now
from django.utils.dateparse import parse_datetime
from rest_framework import generics, permissions
from rest_framework.exceptions import ValidationError
from trampoline_park.permissions import *
from trampoline_park.serializers import *


class UserListApiView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAdminUser,)


class ClientCreateAPIView(generics.CreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientCreateSerializer


class ClientListAPIView(generics.ListAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = (IsAdminOrCoachOrReadOnly,)


class ClientRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = (IsClientOrReadOnly,)


class CoachListAPIView(generics.ListAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer


class CoachRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer
    permission_classes = (IsAdminOrCoachOrReadOnly,)


class WorkoutTypeAPIView(generics.ListAPIView):
    queryset = WorkoutType.objects.all()
    serializer_class = WorkoutTypeSerializer


class WorkoutCreateAPIView(generics.CreateAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
    permission_classes = (IsAdminOrClient,)

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
        today_only = self.request.query_params.get("today")

        if start_date:
            queryset = queryset.filter(datetime__gte=parse_datetime(start_date))  # gte - >=
        if end_date:
            queryset = queryset.filter(datetime__lte=parse_datetime(end_date))  # lte - <=
        if today_only and today_only.lower() == "true":
            queryset = queryset.filter(datetime__date=now().date())

        return queryset


class WorkoutRetrieveDestroyAPIView(generics.RetrieveDestroyAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer


class OptionalServiceListAPIView(generics.ListAPIView):
    queryset = OptionalService.objects.all()
    serializer_class = OptionalServiceSerializer


class CoachCostumeListAPIView(generics.ListAPIView):
    queryset = CoachCostume.objects.all()
    serializer_class = CoachCostumeSerializer


class PhotoVideoServicePriceApiView(generics.ListAPIView):
    queryset = PhotoVideoServicePrice.objects.all()
    serializer_class = PhotoVideoServicePriceSerializer


class EventCreateAPIView(generics.CreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permissions = (IsAdminOrClient,)

    def perform_create(self, serializer):
        date = serializer.validated_data["date"]
        event_start_time = serializer.validated_data["event_start_time"]
        event_end_time = serializer.validated_data["event_end_time"]
        is_photographer = serializer.validated_data["is_photographer"]
        is_videographer = serializer.validated_data["is_videographer"]
        optional_service = serializer.validated_data["optional_service"]
        coach = serializer.validated_data["coach"]
        coach_costume = serializer.validated_data["coach_costume"]

        if Event.objects.filter(date=date,
                                event_start_time=event_start_time,
                                event_end_time=event_end_time,
                                is_photographer=is_photographer,
                                is_videographer=is_videographer,
                                optional_service=optional_service,
                                coach=coach,
                                coach_costume=coach_costume
                                ).exists():
            raise ValidationError("Мероприятие уже создано.")

        serializer.save()


class EventListAPIView(generics.ListAPIView):
    serializer_class = EventSerializer

    def get_queryset(self):
        user = self.request.user
        queryset = Event.objects.all()

        if user.role == 'COACH':
            queryset = queryset.filter(coach=user.coach)
        elif user.role == 'CLIENT':
            queryset = queryset.filter(clients=user.client)

        return queryset
