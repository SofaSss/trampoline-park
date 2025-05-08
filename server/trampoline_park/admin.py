from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.base_user import BaseUserManager

from trampoline_park.models import *


class CustomUserAdmin(UserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'email', 'password', 'role', 'is_active')}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2', 'role'),
        }),
    )

    list_display = ('username', 'email', 'role',)
    search_fields = ('username', 'email')


class ClientAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'phone_number', 'is_healthy', 'user')
    search_fields = ('first_name', 'last_name', 'phone_number')
    list_filter = ('is_healthy',)
    readonly_fields = (
        'first_name', 'last_name', 'date_of_birth', 'phone_number', 'profile_picture', 'is_healthy', 'user')

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def has_add_permission(self, request):
        return False


class CoachAdmin(admin.ModelAdmin):
    fieldsets = (
        ('Персональная информация', {
            'fields': ('first_name', 'last_name', 'date_of_birth', 'phone_number', 'profile_picture')
        }),
        ('Детали', {
            'fields': ('experience', 'quote', 'specialties', 'achievements')
        }),
        ('Пользователь', {
            'fields': ('user',)
        }),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('first_name', 'last_name', 'date_of_birth', 'phone_number', 'user'),
        }),
    )

    list_display = ('first_name', 'last_name', 'date_of_birth', 'phone_number', 'experience')
    search_fields = ('first_name', 'last_name', 'user__username')
    ordering = ('last_name', 'first_name')


class CoachSpecialtyAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


class CoachAchievementAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


class WorkoutTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'duration', 'max_clients')
    search_fields = ('name',)


class WorkoutAdmin(admin.ModelAdmin):
    list_display = ('datetime', 'workout_type', 'coach')
    search_fields = ('coach__last_name', 'coach__first_name', 'clients__first_name', 'clients__last_name')

    fieldsets = (
        ('Тренер', {
            'fields': ('coach',)
        }),
        ('Клиент(ы)', {
            'fields': ('clients',)
        }),
        ('Дата', {
            'fields': ('datetime',)
        }),
        ('Детали', {
            'fields': ('workout_type',)
        }),
    )


class TypeOptionalServiceAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


class OptionalServiceAdmin(admin.ModelAdmin):
    list_display = ('name', 'type', 'price')
    search_fields = ('name',)


class CoachCostumeAdmin(admin.ModelAdmin):
    list_display = ('name', 'price')
    search_fields = ('name',)


class EventAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'clients', 'coach', 'coach_costume')
    search_fields = ('name', 'clients__first_name', 'clients__last_name', 'coach__first_name', 'coach__last_name')
    fieldsets = (
        ('Информация о заказчике', {
            'fields': ('clients', 'name',)
        }),
        ('Дата', {
            'fields': ('date', 'event_start_time', 'event_end_time',)
        }),
        ('Аниматор', {
            'fields': ('coach', 'coach_costume',)
        }),
        ('Детали', {
            'fields': ('is_photographer', 'is_videographer', 'optional_service',)
        }),
    )


admin.site.site_header = "Администрирование Батутного парка №1"
admin.site.site_title = "Батутный парк №1 | Панель администратора"
admin.site.index_title = "Добро пожаловать в админ-панель"
admin.site.register(User, CustomUserAdmin)
admin.site.register(Client, ClientAdmin)
admin.site.register(Coach, CoachAdmin)
admin.site.register(CoachSpecialty, CoachSpecialtyAdmin)
admin.site.register(CoachAchievement, CoachAchievementAdmin)
admin.site.register(WorkoutType, WorkoutTypeAdmin)
admin.site.register(Workout, WorkoutAdmin)
admin.site.register(TypeOptionalService, TypeOptionalServiceAdmin)
admin.site.register(OptionalService, OptionalServiceAdmin)
admin.site.register(CoachCostume, CoachCostumeAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(PhotoVideoServicePrice)
admin.site.register(VideoWarmUp)
admin.site.register(Communication)
