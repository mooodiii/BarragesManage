from django.contrib import admin
from django.contrib.auth.admin import UserAdmin, User
from django.contrib.auth.models import Group
from .models import *


admin.site.index_title = "tableau de bord"
admin.site.site_header = "tableau de bord"
admin.site.site_title = "Gestion barage"
admin.site.unregister(Group)
admin.site.register(Barrages)
admin.site.register(ApportMBinouidane)