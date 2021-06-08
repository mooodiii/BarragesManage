from django.contrib import admin
from django.contrib.auth.admin import UserAdmin, GroupAdmin, User
from django.contrib.auth.models import Group
from .models import *
from django.utils.translation import ugettext_lazy as _


class CustomUserAdmin(UserAdmin):
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',)}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )



admin.site.unregister(User)
admin.site.unregister(Group)
admin.site.register(User, CustomUserAdmin)

admin.site.index_title = "Panneau administration"
admin.site.site_header = "Panneau administration"
admin.site.site_title = "Panneau administration"

admin.site.register(Barrages)
admin.site.register(ApportMBinouidane)
admin.site.register(ApportMComplexHansaliMassira)
admin.site.register(ApportMHassanPrem)
admin.site.register(ApportMmoulayYoussef)