from django.conf import settings
from djoser.serializers import UserCreateSerializer
from rest_framework import serializers
from trampoline_park.models import *


class UserSerializer(UserCreateSerializer):
    class Meta:
        model = User
        fields = ("id", "username", "email", "role", "is_active",)
        ref_name = 'CustomUserSerializer'


class ClientSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    # def create(self, validated_data):
    #     super().create(validated_data)
    #     settings.EMAIL.activation(self.request, context).send(to)

    class Meta:
        model = Client
        fields = (
            "id",
            "first_name", "last_name", "date_of_birth",
            "phone_number", "profile_picture", "is_healthy",
            "user"
        )


class UserWithPasswordSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, required=True, style={'input_type': 'password'})

    class Meta:
        model = User
        fields = ("id", "username", "email", "role", "password", "is_active",)

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        user.role = "client"
        user.save()
        return user


class ClientCreateSerializer(serializers.ModelSerializer):
    user = UserWithPasswordSerializer()

    class Meta:
        model = Client
        fields = (
            "id",
            "first_name", "last_name", "date_of_birth",
            "phone_number", "profile_picture", "is_healthy",
            "user"
        )

    def create(self, validated_data):
        user_data = validated_data.pop("user")
        user_data["role"] = "CLIENT"
        user_data["is_active"] = False
        user = User.objects.create_user(**user_data)
        client = Client.objects.create(user=user, **validated_data)
        return client


class CoachSpecialtySerializer(serializers.ModelSerializer):
    class Meta:
        model = CoachSpecialty
        fields = '__all__'


class CoachAchievementSerializer(serializers.ModelSerializer):
    class Meta:
        model = CoachAchievement
        fields = '__all__'


class CoachSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    specialties = CoachSpecialtySerializer( many=True)
    achievements = CoachAchievementSerializer( many=True)

    class Meta:
        model = Coach
        fields = ("id",
                  "first_name", "last_name", "date_of_birth",
                  "phone_number", "profile_picture", "experience",
                  "quote", "specialties", "achievements",
                  "user")


class WorkoutTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutType
        fields = '__all__'


class WorkoutSerializer(serializers.ModelSerializer):
    is_available = serializers.SerializerMethodField()

    class Meta:
        model = Workout
        fields = '__all__'

    def get_is_available(self, obj):
        return obj.clients.count() < obj.workout_type.max_clients


class TypeOptionalServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = TypeOptionalService
        fields = '__all__'


class OptionalServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = OptionalService
        fields = '__all__'


class CoachCostumeSerializer(serializers.ModelSerializer):
    class Meta:
        model = CoachCostume
        fields = '__all__'


class PhotoVideoServicePriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = PhotoVideoServicePrice
        fields = '__all__'


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'


class VideoWarmUpSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoWarmUp
        fields = '__all__'


class CommunicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Communication
        fields = '__all__'
