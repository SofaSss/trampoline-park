from rest_framework import serializers

from trampoline_park.models import User, Client, Coach, CoachSpecialty, CoachAchievement, WorkoutType, Workout, \
    OptionalService, CoachCostume, Event


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "username", "email", "role")


class ClientSerializer(serializers.ModelSerializer):
    user = UserSerializer()

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
        fields = ("id", "username", "email", "role", "password",)

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
    class Meta:
        model = Coach
        fields = '__all__'


class WorkoutTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutType
        fields = '__all__'


class WorkoutSerializer(serializers.ModelSerializer):
    class Meta:
        model = Workout
        fields = '__all__'


class TypeOptionalServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = WorkoutType
        fields = '__all__'


class OptionalServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = OptionalService
        fields = '__all__'


class CoachCostumeSerializer(serializers.ModelSerializer):
    class Meta:
        model = CoachCostume
        fields = '__all__'


class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'
