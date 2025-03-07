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
