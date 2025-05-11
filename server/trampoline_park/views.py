from django.shortcuts import get_object_or_404
from django.utils.dateparse import parse_datetime
from djoser.email import ActivationEmail
from rest_framework.response import Response
from rest_framework import generics, permissions, status
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import IsAuthenticated
from trampoline_park.permissions import *
from trampoline_park.serializers import *
from djoser import urls


class UserRetrieveApiView(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)


class ClientCreateAPIView(generics.CreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientCreateSerializer

    def perform_create(self, serializer):
        return serializer.save()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        client: Client = self.perform_create(serializer)
        to = [client.user.email]
        context = {"user": client.user}
        ActivationEmail(self.request, context).send(to)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class CurrentClientRetrieveAPIView(generics.RetrieveAPIView):
    serializer_class = ClientSerializer
    permission_classes = (IsAuthenticated,)

    def get_object(self):
        return Client.objects.get(user=self.request.user)


class CurrentCoachRetrieveAPIView(generics.RetrieveAPIView):
    serializer_class = CoachSerializer
    permission_classes = (IsAuthenticated,)

    def get_object(self):
        return Coach.objects.get(user=self.request.user)


class ClientListAPIView(generics.ListAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = (IsAdminOrCoach,)


class ClientRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    permission_classes = (IsClientOrReadOnly,)


class CoachListAPIView(generics.ListAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer
    permission_classes = [IsAuthenticated, ]


class CoachRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer
    permission_classes = (IsAdminOrCoachOrReadOnly,)


class CoachSpecialtyListAPIView(generics.ListAPIView):
    queryset = CoachSpecialty.objects.all()
    serializer_class = CoachSpecialtySerializer
    permission_classes = (IsAdminOrCoach,)


class CoachSpecialtyCreateAPIView(generics.CreateAPIView):
    queryset = CoachSpecialty.objects.all()
    serializer_class = CoachSpecialtySerializer
    permission_classes = (IsAdminOrCoach,)


class CoachAchievementListAPIView(generics.ListAPIView):
    queryset = CoachAchievement.objects.all()
    serializer_class = CoachAchievementSerializer
    permission_classes = (IsAdminOrCoach,)


class CoachAchievementCreateAPIView(generics.CreateAPIView):
    queryset = CoachAchievement.objects.all()
    serializer_class = CoachAchievementSerializer
    permission_classes = (IsAdminOrCoach,)


class WorkoutTypeAPIView(generics.ListAPIView):
    queryset = WorkoutType.objects.all()
    serializer_class = WorkoutTypeSerializer
    permission_classes = (IsAuthenticated,)


class WorkoutTypeRetrieveAPIView(generics.RetrieveAPIView):
    queryset = WorkoutType.objects.all()
    serializer_class = WorkoutTypeSerializer
    permission_classes = (IsAuthenticated,)


class WorkoutUpdateAPIView(generics.UpdateAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
    permission_classes = (IsAdminOrClient,)

    def update(self, request, *args, **kwargs):
        user = request.user

        workout = get_object_or_404(Workout, id=kwargs.get("pk"))

        if workout.clients.filter(id=user.client.id).exists():
            raise ValidationError("Вы уже записаны на эту тренировку.")

        max_clients = workout.workout_type.max_clients
        if workout.clients.count() >= max_clients:
            raise ValidationError(
                f"На данную тренировку уже записано максимальное количество участников.")

        workout.clients.add(user.client)
        workout.save()

        return Response({"detail": "Вы успешно записались на тренировку."})


class ClientWorkoutListApiView(generics.ListAPIView):
    serializer_class = WorkoutSerializer
    permission_classes = (IsAdminOrClient,)

    def get_queryset(self):
        user = self.request.user
        queryset = Workout.objects.filter(clients=user.client)
        date = self.request.query_params.get("date")
        if date:
            parsed_date = parse_datetime(date)
            if parsed_date:
                queryset = queryset.filter(datetime__date=parsed_date.date())
        return queryset


class WorkoutListAPIView(generics.ListAPIView):
    serializer_class = WorkoutSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        user = self.request.user
        queryset = Workout.objects.all()
        coach_id = self.request.query_params.get("coach_id")
        workout_type_id = self.request.query_params.get("workout_type_id")
        date = self.request.query_params.get("date")

        if user.role == 'COACH':
            queryset = queryset.filter(coach=user.coach)

        elif user.role == 'CLIENT':
            if date or workout_type_id or coach_id:
                queryset = Workout.objects.all()
            else:
                queryset = queryset.filter(clients=user.client)

        if coach_id and user.role == 'CLIENT':
            queryset = queryset.filter(coach_id=coach_id)

        if workout_type_id:
            queryset = queryset.filter(workout_type_id=workout_type_id)

        if date:
            parsed_date = parse_datetime(date)
            if parsed_date:
                queryset = queryset.filter(datetime__date=parsed_date.date())

        return queryset


class WorkoutRetrieveAPIView(generics.RetrieveAPIView):
    queryset = Workout.objects.all()
    serializer_class = WorkoutSerializer
    permission_classes = (permissions.IsAuthenticated,)


class TypeOptionalServiceListAPIView(generics.ListAPIView):
    queryset = TypeOptionalService.objects.all()
    serializer_class = TypeOptionalServiceSerializer
    permission_classes = (IsAdminOrClient,)


class OptionalServiceListAPIView(generics.ListAPIView):
    queryset = OptionalService.objects.all()
    serializer_class = OptionalServiceSerializer
    permission_classes = (IsAdminOrClient,)

    def get_queryset(self):
        queryset = OptionalService.objects.all()
        type_optional_service_id = self.request.query_params.get("type_optional_service_id")

        if type_optional_service_id:
            queryset = queryset.filter(type=type_optional_service_id)

        return queryset


class CoachCostumeListAPIView(generics.ListAPIView):
    queryset = CoachCostume.objects.all()
    serializer_class = CoachCostumeSerializer
    permission_classes = (IsAdminOrClient,)


class PhotoVideoServicePriceApiView(generics.RetrieveAPIView):
    queryset = PhotoVideoServicePrice.objects.all()
    serializer_class = PhotoVideoServicePriceSerializer
    permission_classes = (IsAdminOrClient,)


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
        coach_costume = serializer.validated_data["coach_costume"]

        if Event.objects.filter(date=date,
                                event_start_time=event_start_time,
                                event_end_time=event_end_time,
                                is_photographer=is_photographer,
                                is_videographer=is_videographer,
                                coach_costume=coach_costume
                                ).exists():
            raise ValidationError("Мероприятие уже создано.")

        serializer.save()


class EventListAPIView(generics.ListAPIView):
    serializer_class = EventSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        user = self.request.user
        queryset = Event.objects.all()

        if user.role == 'COACH':
            queryset = queryset.filter(coach=user.coach)
        elif user.role == 'CLIENT':
            queryset = queryset.filter(clients=user.client)

        return queryset


class VideoWarmUpRetrieveAPIView(generics.RetrieveAPIView):
    queryset = VideoWarmUp.objects.all()
    serializer_class = VideoWarmUpSerializer
    permission_classes = (permissions.IsAuthenticated,)


class CommunicationListAPIView(generics.ListAPIView):
    queryset = Communication.objects.all()
    serializer_class = CommunicationSerializer
    permission_classes = (permissions.IsAuthenticated,)
