from rest_framework import generics
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
