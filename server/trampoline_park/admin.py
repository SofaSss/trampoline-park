from django.contrib import admin

from trampoline_park.models import *

# Register your models here.
admin.site.register(User)
admin.site.register(Client)
admin.site.register(Coach)

