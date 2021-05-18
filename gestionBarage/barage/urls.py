from django.contrib.auth import login
from django.urls import path

from . import views



urlpatterns = [
    path("", views.index, name="index"),
    path("logout", views.logout, name="logout"),
    path("login/", views.login_view, name="login"),
    path("barages/", views.barageList, name="list"),
    path("barages/<str:barage>", views.freq, name="freq"),
    path("barages/<str:barage>/<int:freq>", views.calcul, name="calcul"),
    path("file", views.file, name="file"),
    path("file/edit", views.editData, name="edit"),
    path("file/check", views.checkData, name="checkFile"),
    path("suiviBilan", views.suiviBilan, name="suiviBilan"),
    path("periode", views.periode, name="periode"),
    path("suiviBilan/getData/<str:periode>", views.getData, name="getData"),
    path("suiviBilan/edit", views.editSuivi, name="editSuivi"),
    path("simulation", views.getSimulation, name="simulation"),
    path("isSuperUser", views.getUser, name="superuser"),
    path("exportCSV/<str:periode>", views.exportCSV, name="csv"),
    path("exportPDF/<str:periode>", views.exportPDF, name="pdf"),
    path("exportEXCEL/<str:periode>", views.exportEXCEL, name="excel"),
]