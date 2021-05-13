from django.contrib import admin
from django.contrib.auth.admin import UserAdmin, User
from django.contrib.auth.models import Group
from .models import *


admin.site.index_title = "Panneau administration"
admin.site.site_header = "Panneau administration"
admin.site.site_title = "Panneau administration"
admin.site.unregister(Group)
admin.site.register(Barrages)
admin.site.register(ApportMBinouidane)
admin.site.register(ApportMComplexHansaliMassira)
admin.site.register(ApportMHassanPrem)
admin.site.register(ApportMmoulayYoussef)