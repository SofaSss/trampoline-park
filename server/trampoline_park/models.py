from django.contrib.auth.models import AbstractUser
from django.db import models

ROLES = [
    ("CLIENT", "CLIENT"),
    ("COACH", "COACH"),
    ("ADMIN", "ADMIN"),
]


class User(AbstractUser):
    first_name = None
    last_name = None
    email = models.EmailField(blank=True, null=True)

    EMAIL_FIELD = "email" #для автоматической отправки писем
    USERNAME_FIELD = "username" #login для авторизации обязательное поле
    REQUIRED_FIELDS = [] #больше обязательных полей не будет
    role = models.CharField(max_length=50, choices=ROLES, default="ADMIN")


class Client(models.Model):
    first_name = models.CharField(max_length=50, blank=False, null=False,)
    last_name = models.CharField(max_length=50, blank=False, null=False,)
    date_of_birth = models.DateField(blank=False, null=False, )
    phone_number = models.CharField(max_length=20, blank=False, null=False, )
    profile_picture = models.FileField(upload_to="profile_pictures", null = True, blank = True)
    is_healthy = models.BooleanField()
    user = models.OneToOneField(User, on_delete=models.CASCADE)

class CoachSpecialty(models.Model):
    name = models.CharField(max_length=150,)

class CoachAchievement(models.Model):
    name = models.CharField(max_length=150)

class Coach(models.Model):
    first_name = models.CharField(max_length=50, blank=False, null=False, )
    last_name = models.CharField(max_length=50, blank=False, null=False, )
    date_of_birth = models.DateField(blank=False, null=False, )
    phone_number = models.CharField(max_length=20, blank=False, null=False, )
    profile_picture = models.FileField(upload_to='profile_pictures')
    experience = models.IntegerField(default=0, blank=False, null=False)
    quote = models.TextField(max_length=300, null=True)  # цитата
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    specialties = models.ManyToManyField(CoachSpecialty,)
    achievements = models.ManyToManyField(CoachAchievement, )


class WorkoutType(models.Model):
    name = models.CharField(max_length=100, unique=True, null=False, blank=False)
    description = models.TextField(max_length=300, null=False, blank=False)
    price = models.IntegerField(null=False, blank=False)
    workout_picture = models.FileField(upload_to='workout_pictures')
    duration = models.IntegerField()


class Workout(models.Model):
    datetime = models.DateTimeField(null=False, blank=False)
    workout_type = models.ForeignKey(WorkoutType, on_delete=models.CASCADE)
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE)
    clients = models.ManyToManyField(Client)


class TypeOptionalService(models.Model):
    name = models.CharField(max_length=100, unique=True)


class OptionalService(models.Model):
    name = models.CharField(max_length=100, unique=True, null=False, blank=False)
    optional_service_picture = models.FileField(upload_to='optional_service_pictures')
    type = models.ForeignKey(TypeOptionalService, on_delete=models.CASCADE)
    price = models.IntegerField()


class CoachCostume(models.Model):
    name = models.CharField(max_length=100, unique=True, blank=False, null=False)
    price = models.IntegerField()


class Event(models.Model):
    name = models.CharField(max_length=100, )
    date = models.DateField(blank=False, null=False)
    event_start_time = models.TimeField(blank=False, null=False)
    event_end_time = models.TimeField(blank=False, null=False)
    is_photographer = models.BooleanField(blank=False, null=False)
    photographer_price = models.IntegerField( blank=False, null=False)
    is_videographer = models.BooleanField(blank=False, null=False)
    videographer_price = models.IntegerField(blank=False, null=False)
    optional_service = models.ForeignKey(OptionalService, on_delete=models.CASCADE, null=True, blank=True)
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE)
    coach_costume = models.ForeignKey(CoachCostume, on_delete=models.CASCADE)
    clients = models.ForeignKey(Client, on_delete=models.CASCADE)
