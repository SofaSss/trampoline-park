from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

from trampoline_park.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/auth/", include("djoser.urls")),
    path("api/auth/", include("djoser.urls.jwt")),
    path('', include('trampoline_park.urls')),

]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_URL)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
