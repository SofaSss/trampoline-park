from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from trampoline_park.models import *


class CustomUserAdmin(UserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'email', 'password', 'role')}),
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
    list_display = ("id", "first_name", "last_name", "phone_number", "is_healthy", "user")
    search_fields = ("first_name", "last_name", "phone_number")
    list_filter = ("is_healthy",)
    readonly_fields = (
        "first_name", "last_name", "date_of_birth", "phone_number", "profile_picture", "is_healthy", "user")

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


admin.site.register(User, CustomUserAdmin)
admin.site.register(Client, ClientAdmin)
admin.site.register(Coach, CoachAdmin)
admin.site.register(CoachSpecialty)
admin.site.register(CoachAchievement)
admin.site.register(WorkoutType)
admin.site.register(Workout)
admin.site.register(TypeOptionalService)
admin.site.register(OptionalService)
admin.site.register(CoachCostume)
admin.site.register(Event)
admin.site.register(PhotoVideoServicePrice)
