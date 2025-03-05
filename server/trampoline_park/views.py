from django.shortcuts import render
from rest_framework import generics

from trampoline_park.models import *
from trampoline_park.serializers import *


# Create your views here.

class ClientCreateAPIView(generics.ListCreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer

class ClientAPIUpdate(generics.RetrieveUpdateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer

class ClientAPIDelete(generics.RetrieveDestroyAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientSerializer


class CoachAPIView(generics.ListCreateAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer

class CoachAPIUpdate(generics.RetrieveUpdateAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer

class CoachAPIDelete(generics.RetrieveDestroyAPIView):
    queryset = Coach.objects.all()
    serializer_class = CoachSerializer


class WorkoutTypeAPIView(generics.ListCreateAPIView):
    queryset = WorkoutType.objects.all()
    serializer_class = WorkoutTypeSerializer