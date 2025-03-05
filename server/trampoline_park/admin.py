from django.contrib import admin

from trampoline_park.models import *

# Register your models here.
admin.site.register(User)
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


