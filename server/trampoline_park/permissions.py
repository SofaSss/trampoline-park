from rest_framework import permissions


class IsClientOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS and request.user.is_authenticated:
            return True
        return request.user.is_authenticated and request.user.role == 'CLIENT'

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user == obj.user


class IsAdminOrCoach(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in ["COACH", "ADMIN"]


class IsAdminOrCoachOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS and request.user.is_authenticated:
            return True
        return request.user.is_authenticated and request.user.role in ["COACH", "ADMIN"]


class IsAdminOrClient(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_authenticated and request.user.role in ["ADMIN", "CLIENT"]
