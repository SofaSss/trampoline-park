from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from trampoline_park.models import *


class CustomUserAdmin(UserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'email', 'password', 'role')}),  # (Название секции, {поля секции: ()})
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),  # настройка отображения - широкая в админке, чтобы удобнее вводить данные
            'fields': ('username', 'email', 'password1', 'password2', 'role'),
        }),
    )

    list_display = ('username', 'email', 'role',) #поля, отображаемые в списке пользователей
    search_fields = ('username', 'email') #поля для поиска

    def save_model(self, request, obj, form, change):
        """хэширование пароля"""
        if change:  # Если пользователь уже существует
            if "password" in form.changed_data:
                obj.set_password(obj.password)
        else:  # Если создаётся новый пользователь
            obj.set_password(obj.password)


# Register your models here.
admin.site.register(User, CustomUserAdmin)
admin.site.register(Client)
admin.site.register(Coach)
admin.site.register(CoachSpecialty)
admin.site.register(CoachAchievement)
admin.site.register(WorkoutType)
admin.site.register(Workout)
admin.site.register(TypeOptionalService)
admin.site.register(OptionalService)
admin.site.register(CoachCostume)
admin.site.register(Event)
