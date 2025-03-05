from django.shortcuts import render
from rest_framework import generics

from trampoline_park.models import *
from trampoline_park.serializers import *


# Create your views here.

class ClientCreateAPIView(generics.ListCreateAPIView):
    queryset = Client.objects.all()
    serializer_class = ClientCreateSerializer