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

    EMAIL_FIELD = "email"  # для автоматической отправки писем
    USERNAME_FIELD = "username"  # login для авторизации обязательное поле
    REQUIRED_FIELDS = []  # больше обязательных полей не будет
    role = models.CharField(max_length=50, choices=ROLES, default="ADMIN")


class Client(models.Model):
    first_name = models.CharField(max_length=50, blank=False, null=False, verbose_name="Имя")
    last_name = models.CharField(max_length=50, blank=False, null=False, verbose_name="Фамилия")
    date_of_birth = models.DateField(blank=False, null=False, verbose_name="Дата рождения")
    phone_number = models.CharField(max_length=20, blank=False, null=False,verbose_name="Номер телефона" )
    profile_picture = models.FileField(upload_to="profile_pictures", null=True, blank=True, verbose_name="Фотография профиля")
    is_healthy = models.BooleanField(verbose_name="Сведения о здорвье")
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name="Пользователь")


class CoachSpecialty(models.Model):
    name = models.CharField(max_length=150, verbose_name="Специальность")


class CoachAchievement(models.Model):
    name = models.CharField(max_length=150, verbose_name="Достижение")


class Coach(models.Model):
    first_name = models.CharField(max_length=50, blank=False, null=False, verbose_name="Имя")
    last_name = models.CharField(max_length=50, blank=False, null=False, verbose_name="Фамилия")
    date_of_birth = models.DateField(blank=False, null=False, verbose_name="Дата рождения")
    phone_number = models.CharField(max_length=20, blank=False, null=False, verbose_name="Номер телефона")
    profile_picture = models.FileField(upload_to='profile_pictures', verbose_name="Фото профиля")
    experience = models.IntegerField(default=0, blank=False, null=False, verbose_name="Стаж")
    quote = models.TextField(max_length=300, null=True, verbose_name="Цитата")
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name="Пользователь")
    specialties = models.ManyToManyField(CoachSpecialty, verbose_name="Специальности")
    achievements = models.ManyToManyField(CoachAchievement, verbose_name="Достижения")


class WorkoutType(models.Model):
    name = models.CharField(max_length=100, unique=True, null=False, blank=False, verbose_name="Название тренировки")
    description = models.TextField(max_length=300, null=False, blank=False, verbose_name="Описание тренировки")
    price = models.IntegerField(null=False, blank=False, verbose_name="Цена")
    workout_picture = models.FileField(upload_to='workout_pictures', verbose_name="Фото")
    duration = models.IntegerField(verbose_name="Продолжительность")
    max_clients = models.IntegerField(default=1, verbose_name="Максимальное количество клиентов")


class Workout(models.Model):
    datetime = models.DateTimeField(null=False, blank=False, verbose_name="Дата и время")
    workout_type = models.ForeignKey(WorkoutType, on_delete=models.CASCADE, null=False, blank=False, verbose_name="Тип тренировки")
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE, null=False, blank=False, verbose_name="Тренер")
    clients = models.ManyToManyField(Client, blank=True,verbose_name="Клиент(ы)")


class TypeOptionalService(models.Model):
    name = models.CharField(max_length=100, unique=True, verbose_name="Тип дополнительной услуги")


class OptionalService(models.Model):
    name = models.CharField(max_length=100, unique=True, null=False, blank=False, verbose_name="Название услуги")
    optional_service_picture = models.FileField(upload_to='optional_service_pictures', verbose_name="Фото")
    type = models.ForeignKey(TypeOptionalService, on_delete=models.CASCADE, verbose_name="Тип услуги")
    price = models.IntegerField(verbose_name="Цена")


class CoachCostume(models.Model):
    name = models.CharField(max_length=100, unique=True, blank=False, null=False, verbose_name="Название")
    price = models.IntegerField(verbose_name="Цена")


class PhotoVideoServicePrice(models.Model):
    photographer_price = models.IntegerField(blank=False, null=False, verbose_name="Цена фотографа")
    videographer_price = models.IntegerField(blank=False, null=False, verbose_name="Цена видеографа")


class Event(models.Model):
    name = models.CharField(max_length=100, verbose_name="Название мероприятия")
    date = models.DateField(blank=False, null=False, verbose_name="Дата")
    event_start_time = models.TimeField(blank=False, null=False, verbose_name="Время начала")
    event_end_time = models.TimeField(blank=False, null=False, verbose_name="Время конца")
    is_photographer = models.BooleanField(blank=False, null=False, verbose_name="Услуги фотографа")
    is_videographer = models.BooleanField(blank=False, null=False,verbose_name="Услуги видеографа")
    optional_service = models.ForeignKey(OptionalService, on_delete=models.CASCADE, null=True, blank=True, verbose_name="Дополнительные услуги")
    coach = models.ForeignKey(Coach, on_delete=models.CASCADE, null=True, blank=True, verbose_name="Тренер")
    coach_costume = models.ForeignKey(CoachCostume, on_delete=models.CASCADE, verbose_name="Костюм")
    clients = models.ForeignKey(Client, on_delete=models.CASCADE, verbose_name="Клиент")
