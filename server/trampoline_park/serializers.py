from rest_framework import serializers

from trampoline_park.models import User, Client, Coach, CoachSpecialty, CoachAchievement, WorkoutType, Workout, \
    OptionalService, CoachCostume, Event


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


# class ClientSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Client
#         fields = '__all__'



# class ClientCreateSerializer(serializers.ModelSerializer):
#     username = serializers.CharField(write_only=True)
#     password = serializers.CharField(write_only=True)
#     email = serializers.EmailField(required=False, allow_blank=True)
#     role = serializers.CharField(default="CLIENT", write_only=True)
#
#
#     class Meta:
#         model = Client
#         fields = [
#             "username", "password", "email", "role",  # Поля User (только для создания)
#             "first_name", "last_name", "date_of_birth",
#             "phone_number", "profile_picture", "is_healthy",
#         ]
#
#     def create(self, validated_data):
#         user_data = {
#             "username": validated_data.pop("username"),
#             "password": validated_data.pop("password"),
#             "email": validated_data.pop("email", ""),
#             "role": validated_data.pop("role", "CLIENT"),
#         }
#         user = User.objects.create_user(**user_data)
#
#         client = Client.objects.create(user=user, **validated_data)
#         return client


class ClientSerializer(serializers.ModelSerializer):
    user = UserSerializer()  # Вложенный сериализатор

    class Meta:
        model = Client
        fields = [
            "id",
            "first_name", "last_name", "date_of_birth",
            "phone_number", "profile_picture", "is_healthy",
            "user"  # Вложенный объект user
        ]



class CoachSerializer(serializers.ModelSerializer):
    class Meta:
        model = Coach
        fields = '__all__'


