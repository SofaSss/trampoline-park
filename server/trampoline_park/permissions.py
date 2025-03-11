from rest_framework import permissions

class IsClientOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS and request.user.is_authenticated:
            return True
        return request.user.is_authenticated and request.user.role == 'CLIENT'

class IsAdminOrCoachOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS and request.user.is_authenticated:
            return True
        return request.user.is_authenticated and request.user.role in ["COACH", "ADMIN"]

class IsAdminOrClient(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in ["ADMIN", "CLIENT"]