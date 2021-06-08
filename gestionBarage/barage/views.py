import json
from django.contrib.auth import authenticate, login as auth_login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.db.models.expressions import F
from django.http import JsonResponse, response
from django.shortcuts import HttpResponse, HttpResponseRedirect, render
from django.urls import reverse
from django.urls.conf import path
from django.views.decorators import csrf
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.csrf import csrf_protect
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.models import Max, Sum, Avg
from .models import *
from .serializers import *
import pandas as pd
from datetime import MAXYEAR, date, datetime
import csv
import xlwt
from django.template.loader import render_to_string
from weasyprint import HTML
import tempfile

# Create your views here.


@api_view(['GET'])
def index(request):
    return render(request, "barage/login.html")


@api_view(['GET'])
def barageList(request):
    barageL = Barrages.objects.all()
    serializer = BarragesSerialize(barageL, many=True)
    return Response(serializer.data)


@api_view(['GET', 'POST'])
@csrf_exempt
def login_view(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect(reverse("home"))
    else:
        if request.method == "POST":
            email = request.POST["email"]
            password = request.POST["password"]
            try:
                username = User.objects.get(email=email).username
            except:
                return render(request, "barage/login.html", {
                    "message": "Email ou/et Mot de pass Incorrect."
                })
            user = authenticate(request, username=username, password=password)

            if user is not None:
                auth_login(request, user)
                return HttpResponseRedirect(reverse("home"))
            else:
                return render(request, "barage/login.html", {
                    "message": "Invalid email and/or password."
                })
        else:
            return render(request, "barage/login.html")


@api_view(['GET'])
def freq(request, barage):
    print(barage)
    if barage == "Complexe A.El Hansali-Massira":
        apport = ApportMComplexHansaliMassira.objects.all()
        serializer = AppHansaliMassiraSerialize(apport, many=True)
    elif barage == "Bin El Ouidane":
        apport = ApportMBinouidane.objects.all()
        serializer = AppBinouidaneSerialize(apport, many=True)
    elif barage == "Moulay Youssef":
        apport = ApportMmoulayYoussef.objects.all()
        serializer = AppmoulayYoussefSerialize(apport, many=True)
    elif barage == "Hassan 1er":
        apport = ApportMHassanPrem.objects.all()
        serializer = AppMHassanPremSerialize(apport, many=True)
    else:
        return Response({"error": "Invalid barage."})
    print(serializer.data)
    return Response(serializer.data)


@api_view(['GET'])
def calcul(request, barage, freq):
    print('helloooooo')
    dataMonth = ["sep", "oct", "nov", "dec", "jan",
                 "feb", "mar", "apr", "may", "jun", "jul", "aug"]
    if barage == "Complexe A.El Hansali-Massira":
        apport = ApportMComplexHansaliMassira.objects.get(freq=int(freq))
        serializer = AppHansaliMassiraSerialize(apport, many=False)
    elif barage == "Bin El Ouidane":
        apport = ApportMBinouidane.objects.get(freq=int(freq))
        serializer = AppBinouidaneSerialize(apport, many=False)
    elif barage == "Moulay Youssef":
        apport = ApportMmoulayYoussef.objects.get(freq=int(freq))
        serializer = AppmoulayYoussefSerialize(apport, many=False)
    elif barage == "Hassan 1er":
        apport = ApportMHassanPrem.objects.get(freq=int(freq))
        serializer = AppMHassanPremSerialize(apport, many=False)
    else:
        return Response({"error": "Invalid barage."})

    return Response(serializer.data)


@api_view(['GET', 'POST'])
def file(request):
    if request.method == "POST":
        file = request.FILES["input"]
        global name
        name = file.name
        print(file.name)
        sheet = request.POST["sheet"]
        print(request.POST["month"])
        try:
            month = request.POST["month"]
            month = month.split('-')
            year = month[0]
            month = month[1]
        except:
            month = 1
            year = 2021
        pdx = pd.read_excel(file, sheet_name=sheet)
        file = file.name
        global mois
        global annee
        month = int(month)
        mois = month
        print(year)
        year = int(year)
        annee = year

        def isLeapYear(year):
            if (year % 4) == 0:
                if (year % 100) == 0:
                    if (year % 400) == 0:
                        return True
                    else:
                        return False
                else:
                    return True
            else:
                return False

        dataMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if isLeapYear(date.today().year):
            dataMonth[2] = 29
        try:
            if 'massira' in file.lower():
                columns = pdx.columns
                title = ['BARRAGE AL MASSIRA',
                        'BILAN HYDRAULIQUE', 'MOIS DE Février 2021']
                barageCheck = MassiraBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        massira = MassiraBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            fuite=row[columns[5]],
                            one=row[columns[6]],
                            onep1=row[columns[7]],
                            onpe2=row[columns[8]],
                            vFond=row[columns[9]],
                            evacCrue=row[columns[10]],
                            total=row[columns[11]],
                            appVolume=row[columns[12]],
                            appDebit=row[columns[13]],
                        )
                        massira.save()

                    upload = BarageUploaded(name="massira", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'hansali' in file.lower():
                columns = pdx.columns
                barageCheck = AelHanssaliBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    pdx = pdx.fillna(value=0)
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        hanssali = AelHanssaliBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            fuite=row[columns[5]],
                            volumeTurbine=row[columns[6]],
                            vsd=row[columns[7]],
                            vsg=row[columns[8]],
                            vDesverse=row[columns[9]],
                            total=row[columns[10]],
                            appVolume=row[columns[11]],
                            appDebit=row[columns[12]],
                        )
                        hanssali.save()
                    upload = BarageUploaded(name="hansali", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'messaoud' in file.lower():
                columns = pdx.columns

                barageCheck = AitMessaoudBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        aitmessaoud = AitMessaoudBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            tauxRemplissage=row[columns[3]],
                            varReserve=row[columns[4]],
                            evaporation=row[columns[5]],
                            fuite=row[columns[6]],
                            volumeTurbine=row[columns[7]],
                            vVidange=row[columns[8]],
                            vEvacue=row[columns[9]],
                            pluie=row[columns[13]],
                            total=row[columns[10]],
                            appVolume=row[columns[11]],
                            appDebit=row[columns[12]],
                        )
                        aitmessaoud.save()

                    upload = BarageUploaded(
                        name="messouad", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'ouidane' in file.lower():
                if isLeapYear(int(sheet)):
                    dataMonth[2] = 29
                pdx.columns = ['Mois', 'Jour', 'Cote', 'Reserve',
                            'variation reserve', 'Evap', 'fuite', 'Volume turbine',
                            'evc', 'vf', 'total', 'debit', 'volumeApport', 'Volume lache']
                pdx = pdx.loc[(pdx['Jour'].isnull() == False) &
                            (pdx['Jour'].str.isalpha() != True)]
                i = 1
                m = 1
                for index, row in pdx.iterrows():
                    if m > 12:
                        break
                    row['Mois'] = m
                    if dataMonth[m] == i:
                        i = 1
                        m += 1
                    else:
                        i += 1
                pdx = pdx.loc[pdx['Mois'] == month]
                barageCheck = BinOuidaneBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        binouidane = BinOuidaneBilanHydr(
                            annee=year,
                            mois=row['Mois'],
                            jour=row['Jour'],
                            cote=row['Cote'],
                            reserve=row['Reserve'],
                            varReserve=row['variation reserve'],
                            evaporation=row['Evap'],
                            fuite=row['fuite'],
                            volumeTurbine=row['Volume turbine'],
                            evc=row['evc'],
                            vf=row['vf'],
                            total=row['total'],
                            appVolume=row['volumeApport'],
                            appDebit=row['debit'],
                            volumeLache=row['Volume lache']
                        )
                        binouidane.save()
                    upload = BarageUploaded(
                        name="binouidane", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'hassan' in file.lower():
                columns = pdx.columns
                barageCheck = HassanPremBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        hassanprem = HassanPremBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            fuite=row[columns[5]],
                            onep=row[columns[6]],
                            one=row[columns[7]],
                            vidFond=row[columns[8]],
                            total=row[columns[10]],
                            appVolume=row[columns[11]],
                            appDebit=row[columns[12]],
                            eCrue=row[columns[9]]
                        )
                        hassanprem.save()
                    upload = BarageUploaded(name="hassan", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'youssef' in  file.lower():
                columns = pdx.columns
                pdx = pdx.fillna(value=0)
                barageCheck = MyYoussefBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        myyoussef = MyYoussefBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            fuite=row[columns[5]],
                            evc=row[columns[6]],
                            v=row[columns[7]],
                            c=row[columns[8]],
                            one=row[columns[9]],
                            total=row[columns[11]],
                            appVolume=row[columns[12]],
                            appDebit=row[columns[13]],
                            vf=row[columns[10]]
                        )
                        myyoussef.save()
                    upload = BarageUploaded(
                        name="myYoussef", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'timinoutine' in  file.lower():
                columns = pdx.columns
                pdx = pdx.fillna(value=0)
                barageCheck = TiminoutineBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        timinoutine = TiminoutineBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            vidange=row[columns[5]],
                            deverse=row[columns[6]],
                            v1=row[columns[7]],
                            v2=row[columns[8]],
                            soltania=row[columns[9]],
                            total=row[columns[10]],
                            volumeApp=row[columns[11]],
                            debitApp=row[columns[12]]
                        )
                        timinoutine.save()
                    upload = BarageUploaded(
                        name="timinoutine", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})

            elif 'driss' in file.lower():
                columns = pdx.columns
                barageCheck = SidiDrissBilanHydr.objects.filter(
                    mois=month, annee=annee)
                if len(barageCheck) < 1:
                    upload = BarageUploaded.objects.all()
                    upload.delete()
                    for index, row in pdx.iterrows():
                        sididriss = SidiDrissBilanHydr(
                            annee=year,
                            mois=month,
                            jour=row[columns[0]],
                            cote=row[columns[1]],
                            reserve=row[columns[2]],
                            varReserve=row[columns[3]],
                            evaporation=row[columns[4]],
                            fuite=row[columns[5]],
                            oued=row[columns[6]],
                            canal=row[columns[7]],
                            vidFond=row[columns[8]],
                            Desverse=row[columns[9]],
                            total=row[columns[10]],
                            appVolume=row[columns[11]],
                            appDebit=row[columns[12]],
                        )
                        sididriss.save()
                    upload = BarageUploaded(name="driss", month=month, year=year)
                    upload.save()
                else:
                    return Response({"error": "existe deja"})
            else:
                upload = BarageUploaded.objects.all()
                upload.delete()
                return HttpResponseRedirect('/Fichier/import')

            return HttpResponseRedirect('/Fichier/submitData')
        except ValueError:
            upload = BarageUploaded.objects.all()
            upload.delete()
            return HttpResponseRedirect('/Fichier/import')
        
    elif request.method == 'GET':

        try:
            upload = BarageUploaded.objects.all()
            upload = upload[0]
            name = upload.name
            month = upload.month
            year = upload.year
        except:
            return Response("error barrage upload")

        if name == "myYoussef":
            barage = MyYoussefBilanHydr.objects.filter(mois=month, annee=year)
            columns = ['Jour', 'Cote', 'Reserve',
                       'variation reserve', 'Evap', 'fuite',
                       'evc', 'v', 'c', 'one', 'vf', 'total',
                       'volumeApport', 'debit']
            dbcolumns = ["jour", "cote", "reserve", "varReserve", "evaporation",
                         "fuite", "evc", "v", "c", "one", "vf", "total", "appVolume", "appDebit"]
            title = ['BARRAGE MY YOUSSEF', 'BILAN HYDRAULIQUE']
            serializer = MyYoussefBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "timinoutine":
            barage = TiminoutineBilanHydr.objects.filter(mois=month, annee=year)
            columns = ['Jour', 'Cote', 'Reserve',
                       'variation reserve', 'Evap', 'V.vidangé',
                       'V.deversé', 'V1', 'V2', 'S.Soltania', 'total',
                       'volumeApport', 'debit']
            dbcolumns = ["jour", "cote", "reserve", "varReserve", "evaporation",
                         "vidange", "deverse", "v1", "v2", "soltania", "total", "volumeApp", "debitApp"]
            title = ['BARRAGE TIMINOUTINE', 'BILAN HYDRAULIQUE']
            serializer = TiminoutineBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "massira":
            barage = MassiraBilanHydr.objects.filter(mois=month, annee=year)
            columns = ["Jour", "Cote", "Reserve", "Variation Reserve",
                       "Evaporation", "Fuites", "ONE", "ONEP1", "ONEP2", "Vid.Fond",
                       "Evac. crue", "Total", "App. Volume", "App. Debit"]
            dbcolumns = ["jour", "cote", "reserve", "varReserve", "evaporation", "fuite",
                         "one", "onep1", "onpe2", "vFond", "evacCrue",
                         "total", "appVolume", "appDebit"]
            title = ['BARRAGE ELMASSIRA', 'BILAN HYDRAULIQUE']
            serializer = MassiraBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "hansali":
            barage = AelHanssaliBilanHydr.objects.filter(
                mois=month, annee=year)
            columns = ["Jour", "Cote", "Reserve", "Variation Reserve", "Evaporation", "Fuites",
                       "V. Turbine", "V.S.D", "V.S.G", "V. DEVERSE", "Total", "App. Volume", "App. Debit"]
            dbcolumns = ["jour", "cote", "reserve", "varReserve",
                         "evaporation", "fuite", "volumeTurbine", "vsd", "vsg", "vDesverse",
                         "total", "appVolume", "appDebit"]
            title = ['BARRAGE ELHANSALI', 'BILAN HYDRAULIQUE']
            serializer = AelHanssaliBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "messouad":
            barage = AitMessaoudBilanHydr.objects.filter(
                mois=month, annee=year)
            columns = ['Jour', 'Cote', 'Reserve', 'taux remplissage',
                       'Variation Reserve', 'Evap', 'fuite', 'V. Turbine',
                       'v vidange', 'v evacue', 'total',
                       'App. Volume', 'App. Debit', 'pluie']
            dbcolumns = ["jour", "cote", "reserve", "tauxRemplissage", "varReserve",
                         "evaporation", "fuite", "volumeTurbine", "vVidange", "vEvacue", "total",
                         "appVolume", "appDebit", "pluie"]
            title = ['BARRAGE AIT MESSAOUD', 'BILAN HYDRAULIQUE']
            serializer = AitMessaoudBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "binouidane":
            barage = BinOuidaneBilanHydr.objects.filter(mois=month, annee=year)
            columns = ['Mois', 'Jour', 'Cote', 'Reserve',
                       'variation reserve', 'Evap', 'fuite', 'Volume turbine',
                       'evc', 'vf', 'total', 'debit', 'volumeApport', 'Volume lache']
            dbcolumns = ["mois", "jour", "cote", "reserve", "varReserve",
                         "evaporation", "fuite", "volumeTurbine", "evc", "vf", "total",
                         "appVolume", "appDebit", "volumeLache"]
            title = ['BARRAGE BIN OUIDANE', 'BILAN HYDRAULIQUE']
            serializer = BinOuidaneBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "hassan":
            barage = HassanPremBilanHydr.objects.filter(mois=month, annee=year)
            columns = ['Jour', 'Cote', 'Reserve',
                       'variation reserve', 'Evap', 'fuite', 'onep',
                       'one', 'vid fond', 'E.Crue', 'total',
                       'volumeApport', 'debit']
            dbcolumns = ["jour", "cote", "reserve", "varReserve",
                         "evaporation", "fuite", "onep", "one", "vidFond",
                         "eCrue", "total", "appVolume", "appDebit"]
            title = ['BARRAGE HASSAN 1er', 'BILAN HYDRAULIQUE']
            serializer = HassanPremBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        elif name == "driss":
            barage = SidiDrissBilanHydr.objects.filter(mois=month, annee=year)
            columns = ["jour", "cote", "reserve", "varReserve", "evaporation", "fuite",
                       "oued", "canal", "vidFond", "Desverse", "total", "appVolume", "appDebit"]
            dbcolumns = ["jour", "cote", "reserve", "varReserve",
                         "evaporation", "fuite", "oued", "canal", "vidFond", "Desverse",
                         "total", "appVolume", "appDebit"]
            title = ['BARRAGE SIDI DRISS', 'BILAN HYDRAULIQUE']
            serializer = SidiDrissBilanSerialize(barage, many=True)
            return Response([serializer.data, title, columns, dbcolumns, name])
        return Response({"error": "error 404"})
    return HttpResponseRedirect('/Fichier/import')


@api_view(['GET', 'PUT'])
def editData(request):
    if request.method == "PUT":
        data = json.loads(request.body)
        if data.get("id") is not None:
            id = data["id"]
        if data.get("column") is not None:
            column = data["column"]
        if data.get("barage") is not None:
            barage = data["barage"]
        if barage == "massira":
            barageL = MassiraBilanHydr.objects.get(id=id)
        elif barage == "myYoussef":
            barageL = MyYoussefBilanHydr.objects.get(id=id)
        elif barage == "timinoutine":
            barageL = TiminoutineBilanHydr.objects.get(id=id)
        elif barage == "hansali":
            barageL = AelHanssaliBilanHydr.objects.get(id=id)
        elif barage == "messouad":
            barageL = AitMessaoudBilanHydr.objects.get(id=id)
        elif barage == "binouidane":
            barageL = BinOuidaneBilanHydr.objects.get(id=id)
        elif barage == "hassan":
            barageL = HassanPremBilanHydr.objects.get(id=id)
        elif barage == "driss":
            barageL = SidiDrissBilanHydr.objects.get(id=id)
        else:
            return Response({"BARAGE": "error 404"})
        
        if data.get("newValue") is not None:
            setattr(barageL, column, data['newValue'])
            barageL.save()

        return Response({"message": "succefully"})

    else:
        return Response({"GEEET": "error 404"})


def transHansali(periode, month, column):
    bilantur=SuiviBilan.objects.filter(
                periode = periode, barage = "A.E.Hansali", suivi = "Turbinages").get()
    bilanvid=SuiviBilan.objects.filter(
                periode = periode, barage = "A.E.Hansali", suivi = "Vidanges +Déversés").get()
    bilanirr=SuiviBilan.objects.filter(
                periode = periode, barage = "Aït Messaoud", suivi = "irrigation").get()
    bilanvaepi=SuiviBilan.objects.filter(
                periode = periode, barage = "Aït Messaoud", suivi = "AEPI").get()
    bilantrans = SuiviBilan.objects.filter(
                periode=periode, barage="A.E.Hansali", suivi="Transfert Massira").get()
    
    

    tur = float(getattr(bilantur, column))
    vid = float(getattr(bilanvid, column))
    irr = float(getattr(bilanirr, column))
    aepi = float(getattr(bilanvaepi, column))

    if int(month) >= 4 and int(month) <= 9:
        result = round(max(0,(tur+vid-((irr+aepi)/0.7))*0.7), 1)
    else:
        result = round(max(0,(tur+vid-((irr+aepi)/0.8))*0.8), 1)
        
    setattr(bilantrans, column, result)
    try:
        hanssali = AelHanssaliFornitures.objects.filter(
                periode=periode, month=column.capitalize()).get()
        hanssali.TransfertMassira=result
        hanssali.save()
    except:
        pass
    bilan = bilantrans
    s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    bilantrans.total = float(s)
    bilantrans.save()
    
def transHassanPrem(periode, month, column):
    bilantur = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="Turbinages").get()
    bilanvid = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="Vidanges +Déversés").get()
    bilancanal = SuiviBilan.objects.filter(
                periode=periode, barage="Sidi Driss", suivi="Canal Rocade").get()
    bilanpmh = SuiviBilan.objects.filter(
                periode=periode, barage="Sidi Driss", suivi="PMH").get()
    bilantrans = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="Transfert Massira").get()
    

    tur = float(getattr(bilantur, column))
    vid = float(getattr(bilanvid, column))
    canal = float(getattr(bilancanal, column))
    pmh = float(getattr(bilanpmh, column))

    if int(month) >= 4 and int(month) <= 9:
        result = round(max(0, (tur + vid - ((canal + pmh)/0.95))*0.7), 1)
    else:
        result = round(max(0, (tur + vid - canal - pmh)*0.8), 1)

    setattr(bilantrans, column, result)
    try:
        hassanPrem = HassanPremFornitures.objects.filter(
                    periode=periode, month=column.capitalize()).get()
        hassanPrem.TransfertMassira=result
        hassanPrem.save()
    except:
        pass
    bilan = bilantrans
    s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    bilantrans.total = float(s)
    bilantrans.save()
    

def TransBinOuidane(periode, month, column):
    bilantur = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="Turbinages").get()
    bilanvid = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="Vidanges +Déversés").get()
    bilanirrigation = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="irrigation").get()
    bilanaepiBm = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="AEPI Béni Méllal").get()
    bilantrans = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="Transfert Massira").get()
    


    tur = float(getattr(bilantur, column))
    vid = float(getattr(bilanvid, column))
    irr = float(getattr(bilanirrigation, column))
    aepibm = float(getattr(bilanaepiBm, str(column)))

    if int(month) >= 4 and int(month) <= 9:
        result = round(max(0, (tur + vid - ((irr + aepibm)/0.9))*0.7), 1)
    else:
        result = round(max(0, (tur + vid - ((irr + aepibm)/0.95))*0.8), 1)

    
    setattr(bilantrans, column, result)
    bilan = bilantrans
    s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    bilantrans.total = float(s)
    try:
        binOuidane = BinOuidaneFornitures.objects.filter(
            periode=periode, month=column.capitalize()).get()
        binOuidane.TransfertMassira = result
        binOuidane.save()
    except:
        pass
    bilantrans.save()
    

def createSuiviBilan(periode) :

    suiviCheck=SuiviBilan.objects.filter(periode = periode)
    if len(suiviCheck) < 1:
        headers=["Turbinages", "Turbinages Afourer", "irrigation",
                   "AEPI Béni Méllal", "Vidanges +Déversés", "Transfert Massira"]
        j = 0
        while j < len(headers):
            print(headers[j])
            t = ["Bin Ouidane", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            if headers[j] == 'Turbinages':
                t[1] = headers[j]

            elif headers[j] == 'Turbinages Afourer':
                t[1] = headers[j]

            elif headers[j] == 'irrigation':
                t[1] = headers[j]

            elif headers[j] == 'AEPI Béni Méllal':
                t[1] = headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1] = headers[j]

            elif headers[j] == 'Transfert Massira':
                t[1] = headers[j]

            total = 0
            s = 2
            while s < len(t):
                total += t[s]
                s += 1
            suivi = SuiviBilan(periode=periode, barage=t[0], suivi=t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1
        headers=["Turbinages", "AEPI Azilal + Demnate", "Vidanges +Déversés", "Transfert Massira"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Hassan 1er", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Turbinages':
                t[1]=headers[j]
            elif headers[j] == 'AEPI Azilal + Demnate':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]

            elif headers[j] == 'Transfert Massira':
                t[1]=headers[j]

            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Canal Rocade", "PMH", "Vidanges +Déversés"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Sidi Driss", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Canal Rocade':
                t[1]=headers[j]

            elif headers[j] == 'PMH':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]

            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Turbinages", "irrigation",
                   "soltania", "Vid +Dév My Youssef", "Transfert Massira"]
        j = 0
        while j < len(headers):
            print(headers[j])
            t = ["My Youssef", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            i = 2
            x=0

            if headers[j] == 'Turbinages':
                t[1] = headers[j]

            elif headers[j] == 'irrigation':
                t[1] = headers[j]

            elif headers[j] == 'soltania':
                t[1] = headers[j]

            elif headers[j] == 'Vid +Dév My Youssef':
                t[1] = headers[j]

            elif headers[j] == 'Transfert Massira':
                t[1] = headers[j]

            total = 0
            s = 2
            while s < len(t):
                total += t[s]
                s += 1
            suivi = SuiviBilan(periode=periode, barage=t[0], suivi=t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Turbinages", "Vidanges +Déversés", "Transfert Massira"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["A.E.Hansali", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Turbinages':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]

            elif headers[j] == 'Transfert Massira':
                t[1]=headers[j]

            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Turbinages", "irrigation", "AEPI", "Vidanges +Déversés"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Aït Messaoud", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Turbinages':
                t[1]=headers[j]

            elif headers[j] == 'irrigation':
                t[1]=headers[j]

            elif headers[j] == 'AEPI':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]


            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Turbinages", "AEPI Rhamna", "AEPI Marrakech", "Vidanges +Déversés"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Al Massira", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Turbinages':
                t[1]=headers[j]

            elif headers[j] == 'AEPI Rhamna':
                t[1]=headers[j]

            elif headers[j] == 'AEPI Marrakech':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]


            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["Turbinages", "irrigation",
                   "AEP S.Bennour+K.Zemamra", "AEP ONEP Doukkala", "Vidanges +Déversés"]
        j = 0
        while j < len(headers):
            print(headers[j])
            t = ["Imfout", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'Turbinages':
                t[1] = headers[j]

            elif headers[j] == 'irrigation':
                t[1] = headers[j]

            elif headers[j] == 'AEP S.Bennour+K.Zemamra':
                t[1] = headers[j]

            elif headers[j] == 'AEP ONEP Doukkala':
                t[1] = headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1] = headers[j]


            total = 0
            s = 2
            while s < len(t):
                total += t[s]
                s += 1
            suivi = SuiviBilan(periode=periode, barage=t[0], suivi=t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["turbinages", "AEP", "Vidanges +Déversés"]
        j = 0
        while j < len(headers):
            print(headers[j])
            t = ["Daourate", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'turbinages':
                t[1] = headers[j]

            elif headers[j] == 'AEP':
                t[1] = headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1] = headers[j]


            total = 0
            s = 2
            while s < len(t):
                total += t[s]
                s += 1
            suivi = SuiviBilan(periode=periode, barage=t[0], suivi=t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1
        headers=["AEP", "Vid +Dév=Turb Excl Sys"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["S.S.Mâachou", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'AEP':
                t[1]=headers[j]

            elif headers[j] == 'Vid +Dév=Turb Excl Sys':
                t[1]=headers[j]


            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["AEP Azemmour"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Sidi Daoui", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'AEP Azemmour':
                t[1]=headers[j]


            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

        headers=["AEPI", "Vidanges +Déversés"]
        j=0
        while j < len(headers):
            print(headers[j])
            t=["Digue Safi", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

            if headers[j] == 'AEPI':
                t[1]=headers[j]

            elif headers[j] == 'Vidanges +Déversés':
                t[1]=headers[j]


            total=0
            s=2
            while s < len(t):
                total += t[s]
                s += 1
            suivi=SuiviBilan(periode = periode, barage = t[0], suivi = t[1],
                               sep = t[2], oct = t[3], nov = t[4], dec = t[5], jan = t[6], feb = t[7],
                               mar = t[8], apr = t[9], may = t[10], jun = t[11], jul = t[12], aug = t[13],
                               total = total
                               )
            suivi.save()
            j += 1

def createVarApport(periode) :
    
    varCheck=VarApport.objects.filter(periode = periode)
    if len(varCheck) < 1:
        headers=["Bin-El ouidane", "Hassan 1er", "My-youssef",
                   "Ahmed El Hansali", "Al Massira Enregitrés", "Al Massira Ap. Inter."]
        j = 0
        while j < len(headers):
            print(headers[j])
            t = ["", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            if headers[j] == 'Bin-El ouidane':
                t[0] = headers[j]

            elif headers[j] == 'Hassan 1er':
                t[0] = headers[j]

            elif headers[j] == 'My-youssef':
                t[0] = headers[j]

            elif headers[j] == 'Ahmed El Hansali':
                t[0] = headers[j]

            elif headers[j] == 'Al Massira Enregitrés':
                t[0] = headers[j]

            elif headers[j] == 'Al Massira Ap. Inter.':
                t[0] = headers[j]

            total = 0
            s = 2
            while s < len(t):
                total += t[s]
                s += 1
            suivi = VarApport(periode=periode, barage=t[0],
                               sep = t[1], oct = t[2], nov = t[3], dec = t[4], jan = t[5], feb = t[6],
                               mar = t[7], apr = t[8], may = t[9], jun = t[10], jul = t[11], aug = t[12],
                               total = total
                               )
            suivi.save()
            j += 1

def enterVarApport(periode, barage, varData, apport):
    Aport = VarApport.objects.filter(periode= periode, barage=barage).get()
    setattr(Aport, varData, apport)
    Aport.save()

    bilan = VarApport.objects.filter(periode= periode, barage=barage).get()
    total = float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    setattr(bilan, "total", round(total, 1))
    bilan.save()

def calcInternMassira(periode, varData):
    totalEnrg=VarApport.objects.filter(periode = periode, barage="Al Massira Enregitrés").get()
    totalTrans = TransfertMassira.objects.filter(periode= periode, suivi="Total Transfert vers Massira").get()
    totalInter=VarApport.objects.filter(periode = periode, barage="Al Massira Ap. Inter.").get()
    trans = getattr(totalTrans, varData)
    enreg = getattr(totalEnrg, varData)
    result = float(enreg) - float(trans)
    setattr(totalInter, varData, result)
    totalInter.save()

    bilan = VarApport.objects.filter(periode= periode, barage="Al Massira Ap. Inter.").get()
    total = float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    setattr(bilan, "total", round(total, 1))
    bilan.save()

def TransYoussef(periode, month, column):
    bilantur = SuiviBilan.objects.filter(
                periode=periode, barage="My Youssef", suivi="Turbinages").get()
    bilanvid = SuiviBilan.objects.filter(
                periode=periode, barage="My Youssef", suivi="Vid +Dév My Youssef").get()
    bilansol = SuiviBilan.objects.filter(
                periode=periode, barage="My Youssef", suivi="irrigation").get()
    bilanirr = SuiviBilan.objects.filter(
                periode=periode, barage="My Youssef", suivi="soltania").get()
    bilantrans = SuiviBilan.objects.filter(
                periode=periode, barage="My Youssef", suivi="Transfert Massira").get()



    tur = float(getattr(bilantur, column))
    vid = float(getattr(bilanvid, column))
    irr = float(getattr(bilanirr, column))
    sol = float(getattr(bilansol, str(column)))

    if int(month) >= 4 and int(month) <= 9:
        result = round(max(0,(tur+vid-irr-sol)*0.7), 1)
    else:
        result = round(max(0, (tur+vid-irr-sol)*0.8), 1)

    
    setattr(bilantrans, column, result)
    bilan = bilantrans
    s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
    bilantrans.total = float(s)
    try:
        youssef = MyYoussefFornitures.objects.filter(
        periode=periode, month=column.capitalize()).get()
        youssef.TransfertMassira = result
        youssef.save()
    except:
        pass
    bilantrans.save()
    

def totalAepiTrans(periode, dataMonth, i):
    print('wa wellah hta dkhel yhsseb')
    #total aerpi almassira
    imfoutAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Imfout", suivi = "AEP S.Bennour+K.Zemamra").get()
    massiraRhamna=SuiviBilan.objects.filter(
                    periode = periode, barage = "Al Massira", suivi = "AEPI Rhamna").get()
    massiraKech=SuiviBilan.objects.filter(
                    periode = periode, barage = "Al Massira", suivi = "AEPI Marrakech").get()
    daourateAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Daourate", suivi = "AEP").get()
    maachoAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "S.S.Mâachou", suivi = "AEP").get()
    daouiAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Sidi Daoui", suivi = "AEP Azemmour").get()
    digueAepi=SuiviBilan.objects.filter(
                    periode = periode, barage = "Digue Safi", suivi = "AEPI").get()

    #total transfert al massira
    binOuidaneTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="Bin Ouidane", suivi="Transfert Massira").get()
    hassanTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="Hassan 1er", suivi="Transfert Massira").get()
    youssefTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="Transfert Massira").get()
    hansaliTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="A.E.Hansali", suivi="Transfert Massira").get()

    
    totalTrans = TransfertMassira.objects.filter(periode= periode, suivi="Total Transfert vers Massira").get()
    totalAepi = TransfertMassira.objects.filter(periode= periode, suivi="Total AEPI Al Massira").get()

    val1 = float(getattr(imfoutAep, dataMonth[i]))
    val2 = float(getattr(massiraRhamna, dataMonth[i]))
    val3 = float(getattr(massiraKech, dataMonth[i]))
    val4 = float(getattr(daourateAep, dataMonth[i]))
    val5 = float(getattr(maachoAep, dataMonth[i]))
    val6 = float(getattr(daouiAep, dataMonth[i]))
    val7 = float(getattr(digueAepi, dataMonth[i]))
    resultAepi = val1 + val2 + val3 + val4 + val5 + val6 + val7

    setattr(totalAepi, dataMonth[i], resultAepi)

    val1 = float(getattr(binOuidaneTrans, dataMonth[i]))
    val2 = float(getattr(hassanTrans, dataMonth[i]))
    val3 = float(getattr(youssefTrans, dataMonth[i]))
    val4 = float(getattr(hansaliTrans, dataMonth[i]))
    resultTrans = val1 + val2 + val3 + val4
    setattr(totalTrans, dataMonth[i], resultTrans)
    totalTrans.save()
    totalAepi.save()





        
@api_view(['GET'])
def suiviBilan(request):
    try:
        upload = BarageUploaded.objects.all()
        upload = upload[0]
        name = upload.name
        month = upload.month
        year = upload.year
    except:
        return Response("noo akhoya")
    dataMonth = ["", "Jan", "Feb", "Mar", "Apr", "May",
                 "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    varData = ["", "jan", "feb", "mar", "apr", "may",
                 "jun", "jul", "aug", "sep", "oct", "nov", "dec"]

    if month >= 9:
        periode = f"{year}-{year + 1}"
    else:
        periode = f"{year - 1}-{year}"
    
    createSuiviBilan(periode)
    createVarApport(periode)

    if name == "myYoussef" or name == "timinoutine":
        print("dkhelttttttttttttttt")
        check = MyYoussefFornitures.objects.filter(
            year=year, month=varData[month])
        
        if len(check) < 1:
            barageY = MyYoussefBilanHydr.objects.filter(mois=month, annee=year)
            print("hada dyal barageYousef", str(len(barageY)))
            
            barageT = TiminoutineBilanHydr.objects.filter(mois=month, annee=year)
            print("hada dyal baragetIMOUTINE", str(len(barageT)))
            if len(barageY) < 1 or len(barageT) < 1:
                print('dkhellllll akhoya ')
                return Response({'redirect': True})
            else:
                print('madahach f if')
                turbinage = barageY.aggregate(Sum('one'))['one__sum']
                apport = barageY.aggregate(Sum('appVolume'))['appVolume__sum']
                v1 = barageT.aggregate(Sum('v1'))['v1__sum']
                v2 = barageT.aggregate(Sum('v2'))['v2__sum']

                vid = barageT.aggregate(Sum('vidange'))['vidange__sum']
                dev = barageT.aggregate(Sum('deverse'))['deverse__sum']

                irrigation = float(v1) + float(v2)
                vidPdev = float(vid) + float(dev)
                soltania = barageT.aggregate(Sum('soltania'))['soltania__sum']

                myYoussef = MyYoussefFornitures(
                    periode=periode,
                    month=dataMonth[month],
                    turbinage = turbinage,
                    irrigation = irrigation,
                    soltania = soltania,
                    vidPdev = vidPdev,
                    TransfertMassira = 0,
                    year=year,
                    aport = apport,
                )
                myYoussef.save()

                bilantur = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="Turbinages").get()
                bilanvid = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="Vid +Dév My Youssef").get()
                bilansol = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="irrigation").get()
                bilanirr = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="soltania").get()


                enterVarApport(periode, "My-youssef", varData[month], apport)

                setattr(bilantur, varData[month], turbinage)
                setattr(bilanvid, varData[month], vidPdev)
                setattr(bilansol, varData[month], soltania)
                setattr(bilanirr, varData[month], irrigation)

                bilantur.save()
                bilanvid.save()
                bilansol.save()
                bilanirr.save()
                TransYoussef(periode, month, varData[month])
                
                totalAepiTrans(periode, varData, month)
                calcInternMassira(periode, varData[month])

    elif name == "binouidane":
        check = BinOuidaneFornitures.objects.filter(
            year=year, month=dataMonth[month])
        if len(check) < 1:
            barage = BinOuidaneBilanHydr.objects.filter(mois=month, annee=year)
            turbinage = barage.aggregate(Sum('volumeTurbine'))[
                'volumeTurbine__sum']
            vid = barage.aggregate(Sum('evc'))
            Pdiv = barage.aggregate(Sum('vf'))
            vidPdiv = vid['evc__sum'] + Pdiv['vf__sum']
            apport = barage.aggregate(Sum('appVolume'))['appVolume__sum']
            binouidane = BinOuidaneFornitures(
                periode=periode,
                month=dataMonth[month],
                turbinage=round(turbinage, 1),
                vidPdev=round(vidPdiv, 1),
                turbinageAfourer=0,
                irrigation=0,
                aepiBm=0,
                TransfertMassira=0,
                aport=apport,
                year=year
            )
            binouidane.save()
            bilantur = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="Turbinages").get()
            bilanvid = SuiviBilan.objects.filter(
                periode=periode, barage="Bin Ouidane", suivi="Vidanges +Déversés").get()

            enterVarApport(periode, "Bin-El ouidane", varData[month], apport)
            

            setattr(bilantur, varData[month], turbinage)
            bilan = bilantur
            s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
            bilantur.total = s
            setattr(bilanvid, varData[month], vidPdiv)
            bilan = bilanvid
            s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
            bilanvid.total = s
            bilantur.save()
            bilanvid.save()
            
            TransBinOuidane(periode, month, varData[month])
            
            totalAepiTrans(periode, varData, month)
            calcInternMassira(periode, varData[month])

    elif name == "hassan":
        print('hahooooooowa')
        check = HassanPremFornitures.objects.filter(
            year=year, month=dataMonth[month])
        if len(check) < 1:
            print('hahowa dkhel mn mor check')
            barage = HassanPremBilanHydr.objects.filter(mois=month, annee=year)
            turbinage = barage.aggregate(Sum('one'))['one__sum']
            aepi = barage.aggregate(Sum('onep'))['onep__sum']
            vid = barage.aggregate(Sum('vidFond'))['vidFond__sum']
            div = barage.aggregate(Sum('eCrue'))['eCrue__sum']
            apport = barage.aggregate(Sum('appVolume'))['appVolume__sum']
            vidPdiv = vid + div
            hassan = HassanPremFornitures(
                periode=periode,
                month=dataMonth[month],
                turbinage=round(turbinage, 1),
                aepiAzDem=round(aepi, 1),
                vidPdev=round(vidPdiv, 1),
                TransfertMassira=0,
                aport=apport,
                year=year
            )
            hassan.save()
            bilantur = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="Turbinages").get()
            bilanvid = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="Vidanges +Déversés").get()
            bilanaepi = SuiviBilan.objects.filter(
                periode=periode, barage="Hassan 1er", suivi="AEPI Azilal + Demnate").get()

            enterVarApport(periode, "Hassan 1er", varData[month], apport)
            

            setattr(bilantur, varData[month], turbinage)
            setattr(bilanvid, varData[month], vidPdiv)
            setattr(bilanaepi, varData[month], aepi)

            bilantur.save()
            bilanvid.save()
            bilanaepi.save()
            transHassanPrem(periode, month, varData[month])
            
            totalAepiTrans(periode, varData, month)
            calcInternMassira(periode, varData[month])

    elif name == "driss":
        check=SidiDrissFornitures.objects.filter(
            year = year, month = dataMonth[month])
        if len(check) < 1:
            barage=SidiDrissBilanHydr.objects.filter(
                mois = month, annee = year)
            canal=barage.aggregate(Sum('canal'))['canal__sum']
            pmh=barage.aggregate(Sum('oued'))['oued__sum']
            vid=barage.aggregate(Sum('vidFond'))['vidFond__sum']
            div=barage.aggregate(Sum('Desverse'))['Desverse__sum']
            vidPdiv=vid + div
            driss=SidiDrissFornitures(
                periode = periode,
                month = dataMonth[month],
                Canal = round(canal, 1),
                pmh = round(pmh, 1),
                vidPdev = round(vidPdiv, 1),
                year = year
            )
            driss.save()
            bilantur=SuiviBilan.objects.filter(
                periode = periode, barage = "Sidi Driss", suivi = "Canal Rocade").get()
            bilanvid=SuiviBilan.objects.filter(
                periode = periode, barage = "Sidi Driss", suivi = "Vidanges +Déversés").get()
            bilanpmh=SuiviBilan.objects.filter(
                periode = periode, barage = "Sidi Driss", suivi = "PMH").get()

            setattr(bilantur, varData[month], canal)
            setattr(bilanvid, varData[month], vidPdiv)
            setattr(bilanpmh, varData[month], pmh)
            bilantur.save()
            bilanvid.save()
            bilanpmh.save()
            TransYoussef(periode, month, varData[month])
            TransBinOuidane(periode, month, varData[month])
            transHassanPrem(periode, month, varData[month])
            transHansali(periode, month, varData[month])
            totalAepiTrans(periode, varData, month)

    elif name == "massira":
        check=MassiraFornitures.objects.filter(
            year = year, month = dataMonth[month])
        if len(check) < 1:
            barage=MassiraBilanHydr.objects.filter(mois = month, annee = year)
            turbinage=barage.aggregate(Sum('one'))['one__sum']
            aepiRhamna=barage.aggregate(Sum('onep1'))['onep1__sum']
            aepiKech=barage.aggregate(Sum('onpe2'))['onpe2__sum']
            vid=barage.aggregate(Sum('vFond'))
            Pdiv=barage.aggregate(Sum('evacCrue'))
            vidPdiv=vid['vFond__sum'] + Pdiv['evacCrue__sum']
            apport = barage.aggregate(Sum('appVolume'))['appVolume__sum']
            massira=MassiraFornitures(
                periode = periode,
                month = dataMonth[month],
                turbinage = round(turbinage, 1),
                aepiRhamna = round(aepiRhamna, 1),
                aepiKech = round(aepiKech, 1),
                vidPdev = round(vidPdiv, 1),
                aport=apport,
                year = year
            )
            massira.save()
            bilantur=SuiviBilan.objects.filter(
                periode = periode, barage = "Al Massira", suivi = "Turbinages").get()
            bilanRhamna=SuiviBilan.objects.filter(
                periode = periode, barage = "Al Massira", suivi = "AEPI Rhamna").get()
            bilanKech=SuiviBilan.objects.filter(
                periode = periode, barage = "Al Massira", suivi = "AEPI Marrakech").get()
            bilanvid=SuiviBilan.objects.filter(
                periode = periode, barage = "Al Massira", suivi = "Vidanges +Déversés").get()


            enterVarApport(periode, "Al Massira Enregitrés", varData[month], apport)
            
            
            setattr(bilantur, varData[month], turbinage)
            setattr(bilanvid, varData[month], vidPdiv)
            setattr(bilanRhamna, varData[month], aepiRhamna)
            setattr(bilanKech, varData[month], aepiKech)
            bilantur.save()
            bilanvid.save()
            bilanKech.save()
            bilanRhamna.save()
            totalAepiTrans(periode, varData, month)
            calcInternMassira(periode, varData[month])

    elif name == "hansali":
        check=AelHanssaliFornitures.objects.filter(
            year = year, month = dataMonth[month])
        if len(check) < 1:
            barage=AelHanssaliBilanHydr.objects.filter(
                mois = month, annee = year)
            turbinage=barage.aggregate(Sum('volumeTurbine'))['volumeTurbine__sum']
            vsd = barage.aggregate(Sum('vsd'))
            vsg = barage.aggregate(Sum('vsg'))
            dev = barage.aggregate(Sum('vDesverse'))
            vidPdiv= vsd['vsd__sum'] + vsg['vsg__sum'] + dev['vDesverse__sum']
            apport = barage.aggregate(Sum('appVolume'))['appVolume__sum']
            hansali = AelHanssaliFornitures(
                periode = periode,
                month = dataMonth[month],
                turbinage = round(turbinage, 1),
                vidPdev = round(vidPdiv, 1),
                TransfertMassira = 0,
                aport=apport,
                year = year
            )
            hansali.save()
            bilantur=SuiviBilan.objects.filter(
                periode = periode, barage = "A.E.Hansali", suivi = "Turbinages").get()
            bilanvid=SuiviBilan.objects.filter(
                        periode = periode, barage = "A.E.Hansali", suivi = "Vidanges +Déversés").get()

            enterVarApport(periode, "Ahmed El Hansali", varData[month], apport)
            
            setattr(bilantur, varData[month], turbinage)
            setattr(bilanvid, varData[month], vidPdiv)
            bilantur.save()
            bilanvid.save()
            transHansali(periode, month, varData[month])
            
            totalAepiTrans(periode, varData, month)
            calcInternMassira(periode, varData[month])

    elif name == "messouad":
        check=AitMessaoudFornitures.objects.filter(
            year = year, month = dataMonth[month])
        if len(check) < 1:
            barage=AitMessaoudBilanHydr.objects.filter(
                mois = month, annee = year)
            vid=barage.aggregate(Sum('vVidange'))
            Pdiv=barage.aggregate(Sum('vEvacue'))
            vidPdiv=vid['vVidange__sum'] + Pdiv['vEvacue__sum']
            messaoud=AitMessaoudFornitures(
                periode = periode,
                month = dataMonth[month],
                turbinage = 0,
                irrigation = 0,
                aepi = 0,
                vidPdev = round(vidPdiv, 1),
                year = year
            )
            messaoud.save()
            bilanvid=SuiviBilan.objects.filter(
                periode = periode, barage = "Aït Messaoud", suivi = "Vidanges +Déversés").get()

            setattr(bilanvid, varData[month], vidPdiv)
            bilanvid.save()
            totalAepiTrans(periode, varData, month)

    
    #-------------------Total Transfert al massira---------------------#
    print (periode)
    periode = "2020-2021"
    transMass = TransfertMassira.objects.filter(periode = periode)
    if len(transMass) < 1:
        #total aerpi almassira
        imfoutAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Imfout", suivi = "AEP S.Bennour+K.Zemamra").get()
        massiraRhamna=SuiviBilan.objects.filter(
                    periode = periode, barage = "Al Massira", suivi = "AEPI Rhamna").get()
        massiraKech=SuiviBilan.objects.filter(
                    periode = periode, barage = "Al Massira", suivi = "AEPI Marrakech").get()
        daourateAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Daourate", suivi = "AEP").get()
        maachoAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "S.S.Mâachou", suivi = "AEP").get()
        daouiAep=SuiviBilan.objects.filter(
                    periode = periode, barage = "Sidi Daoui", suivi = "AEP Azemmour").get()
        digueAepi=SuiviBilan.objects.filter(
                    periode = periode, barage = "Digue Safi", suivi = "AEPI").get()

            #total transfert al massira
        binOuidaneTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="Bin Ouidane", suivi="Transfert Massira").get()
        hassanTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="Hassan 1er", suivi="Transfert Massira").get()
        youssefTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="My Youssef", suivi="Transfert Massira").get()
        hansaliTrans = SuiviBilan.objects.filter(
                    periode=periode, barage="A.E.Hansali", suivi="Transfert Massira").get()


        dataMonth = ["", "sep", "oct", "nov", "dec", "jan", "feb", "mar", "apr", "may",
                    "jun", "jul", "aug"]
    
    
        headers = ["Total AEPI Al Massira", "Total Transfert vers Massira"]
        j = 0
        while j < len(headers):
            t=["", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            i=1
            while i < len(dataMonth):
                if headers[j] == "Total AEPI Al Massira":
                    val1 = float(getattr(imfoutAep, dataMonth[i]))
                    val2 = float(getattr(massiraRhamna, dataMonth[i]))
                    val3 = float(getattr(massiraKech, dataMonth[i]))
                    val4 = float(getattr(daourateAep, dataMonth[i]))
                    val5 = float(getattr(maachoAep, dataMonth[i]))
                    val6 = float(getattr(daouiAep, dataMonth[i]))
                    val7 = float(getattr(digueAepi, dataMonth[i]))
                    result = val1 + val2 + val3 + val4 + val5 + val6 + val7
                    t[0] = headers[j]
                    t[i] = round(result, 1)
                    i+=1
                    continue
                elif headers[j] == "Total Transfert vers Massira":
                    val1 = float(getattr(binOuidaneTrans, dataMonth[i]))
                    val2 = float(getattr(hassanTrans, dataMonth[i]))
                    val3 = float(getattr(youssefTrans, dataMonth[i]))
                    val4 = float(getattr(hansaliTrans, dataMonth[i]))
                    result = val1 + val2 + val3 + val4
                    t[0] = headers[j]
                    t[i] = round(result, 1)
                    i+=1
                    continue
            total=0
            s=1
            while s < len(t):
                total += t[s]
                s += 1
            trans = TransfertMassira(periode = periode,suivi = t[0],
                               sep = t[1], oct = t[2], nov = t[3], dec = t[4], jan = t[5], feb = t[6],
                               mar = t[7], apr = t[8], may = t[9], jun = t[10], jul = t[11], aug = t[12],
                               total = total
                               )
            trans.save()
            j+=1
    else:
        totalAepiTrans(periode, varData, month)




    
    suivibilan=SuiviBilan.objects.filter(periode = periode)
    suiviSerialize=suiviBilanSerialize(suivibilan, many = True)
    return Response([suiviSerialize.data])


@api_view(['POST', 'GET'])
def checkData(request):
    if request.method == "POST":
        print('dkhelt')
        data = json.dumps(request.data)
        data = json.loads(data)
        print(data)
        if data.get("annee") is not None:
            annee = data["annee"]
        if data.get("month") is not None:
            month = data["month"]
        if data.get("barage") is not None:
            barage = data["barage"]
        if "massira" in barage.lower() :
            barageL = MassiraBilanHydr.objects.filter()
        elif "youssef" in  barage.lower():
            barageL = MyYoussefBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "timinoutine" in barage.lower():
            barageL = TiminoutineBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "hansali" in barage.lower() :
            barageL = AelHanssaliBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "messaoud" in  barage.lower():
            barageL = AitMessaoudBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "ouidane" in barage.lower():
            barageL = BinOuidaneBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "hassan" in  barage.lower():
            barageL = HassanPremBilanHydr.objects.filter(annee = int(annee), mois = int(month))
        elif "driss" in barage.lower():
            barageL = SidiDrissBilanHydr.objects.filter(annee = int(annee), mois = int(month))

        if len(barageL) > 1:
            return Response({'exist': True})
        else:
            return Response({'exist': False})
    else:
        pass

@api_view(['GET'])
def periode(request):
    suivibilan=SuiviBilan.objects.all().values('periode').distinct()

    return Response(suivibilan)


@api_view(['GET'])
def getData(request, periode):
    trans = TransfertMassira.objects.filter(periode = periode)
    suivibilan=SuiviBilan.objects.filter(periode = periode)
    varApport = VarApport.objects.filter(periode = periode)

    ApportSerialize = VarApportSerialize(varApport, many=True)
    transSerialize = TransfertSerialize(trans, many=True)
    suiviSerialize=suiviBilanSerialize(suivibilan, many = True)
    return Response([suiviSerialize.data, transSerialize.data, ApportSerialize.data])


@api_view(['GET'])
def getUser(request):
    if request.user.is_authenticated:
        if request.user.is_superuser:
            return Response({'superUser': True})
        else:
            return Response({'superUser': False})

    return Response({'superUser': False})


@api_view(['GET', 'PUT'])
def editSuivi(request):
    if request.method == "PUT":
        varData = ["", "jan", "feb", "mar", "apr", "may",
                 "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
        dataMonth = {"jan": 1, "feb": 2, "mar": 3, "apr": 4, "may": 5,
                 "jun": 6, "jul": 7, "aug" : 8, "sep": 9, "oct": 10, "nov" : 11, "dec": 12}
        data=json.loads(request.body)
        if data.get("id") is not None:
            id=data["id"]
        if data.get("column") is not None:
            column=data["column"]
        if data.get("periode") is not None:
            periode=data["periode"]
        bilan=SuiviBilan.objects.filter(periode = periode, id = id).get()
        if data.get("newValue") is not None:
            setattr(bilan, column, data['newValue'])
            bilan.save()
        s=float(bilan.sep) + float(bilan.oct) + float(bilan.nov) + float(bilan.dec) + float(bilan.jan) + float(bilan.feb) + float(bilan.mar) + float(bilan.apr) + float(bilan.may) + float(bilan.jun) + float(bilan.jul) + float(bilan.aug)
        print(s)
        bilan.total=float(s)
        bilan.save()
        TransBinOuidane(periode, dataMonth[column], column)
        transHassanPrem(periode, dataMonth[column], column)
        transHansali(periode, dataMonth[column], column)
        TransYoussef(periode, dataMonth[column], column)
        
        totalAepiTrans(periode, varData, dataMonth[column])
        calcInternMassira(periode, column)
        return Response({"message": "succefully"})

    else:
        return Response({"GEEET": "error 404"})


@api_view(['GET', 'POST'])
def getSimulation(request):
    if request.method == 'POST':
        data= json.dumps(request.data)
        data = json.loads(data)
        if data.get("reserve") is not None:
            reserve=data["reserve"]
        if data.get("evap") is not None:
            evap=data["evap"]
        if data.get("barage") is not None:
            barage=data["barage"]
        
        first = evap[0]
        end = evap[1]
        
        if barage == "binOuidane":
            barageR = BinOuidaneBilanHydr.objects.filter(annee = int(reserve[0]), mois = int(reserve[1]), jour = int(reserve[2]))
            if len(barageR) < 1:
                return Response({'error' : True})
            barageR = barageR.get()
            barageE = BinOuidaneBilanHydr.objects.all()


            reserveResult = barageR.reserve

            result = 0
            for b in barageE:
                if b.annee == first[0] and b.jour >= first[2] and b.mois >= first[1]:
                    result += float(b.evaporation)
                if b.annee == end[0] and b.jour == end[2] and b.mois == end[1]:
                    break
            
            apport99 = ApportMBinouidane.objects.get(freq=99)
            serializer99 = AppBinouidaneSerialize(apport99, many=False)
            apport98 = ApportMBinouidane.objects.get(freq=98)
            serializer98 = AppBinouidaneSerialize(apport98, many=False)
            apport95 = ApportMBinouidane.objects.get(freq=95)
            serializer95 = AppBinouidaneSerialize(apport95, many=False)
            apport90 = ApportMBinouidane.objects.get(freq=90)
            serializer90 = AppBinouidaneSerialize(apport90, many=False)
        
        elif barage == "youssef":
            barageR = MyYoussefBilanHydr.objects.filter(annee = int(reserve[0]), mois = int(reserve[1]), jour = int(reserve[2]))
            if len(barageR) < 1:
                return Response({'error' : True})
            barageR = barageR.get()
            barageE = MyYoussefBilanHydr.objects.all()


            reserveResult = barageR.reserve

            result = 0
            for b in barageE:
                if b.annee == first[0] and b.jour >= first[2] and b.mois >= first[1]:
                    result += float(b.evaporation)
                if b.annee == end[0] and b.jour == end[2] and b.mois == end[1]:
                    break
            
            apport99 = ApportMmoulayYoussef.objects.get(freq=99)
            serializer99 = AppmoulayYoussefSerialize(apport99, many=False)
            apport98 = ApportMmoulayYoussef.objects.get(freq=98)
            serializer98 = AppmoulayYoussefSerialize(apport98, many=False)
            apport95 = ApportMmoulayYoussef.objects.get(freq=95)
            serializer95 = AppmoulayYoussefSerialize(apport95, many=False)
            apport90 = ApportMmoulayYoussef.objects.get(freq=90)
            serializer90 = AppmoulayYoussefSerialize(apport90, many=False)
        
        elif barage == "complex":
            #massira
            barageRMassira = MassiraBilanHydr.objects.filter(annee = int(reserve[0]), mois = int(reserve[1]), jour = int(reserve[2]))
            if len(barageRMassira) < 1:
                return Response({'error' : True})
            barageRMassira = barageRMassira.get()
            barageEMassira = MassiraBilanHydr.objects.all()


            reserveResultM = barageRMassira.reserve

            resultM = 0
            for b in barageEMassira:
                if b.annee == first[0] and b.jour >= first[2] and b.mois >= first[1]:
                    resultM += float(b.evaporation)
                if b.annee == end[0] and b.jour == end[2] and b.mois == end[1]:
                    break

            #hansali
            barageRhansali = AelHanssaliBilanHydr.objects.filter(annee = int(reserve[0]), mois = int(reserve[1]), jour = int(reserve[2]))
            if len(barageRhansali) < 1:
                return Response({'error' : True})
            barageRhansali = barageRhansali.get()
            barageEhansali = AelHanssaliBilanHydr.objects.all()


            reserveResultH = barageRhansali.reserve

            resultH = 0
            for b in barageEhansali:
                if b.annee == first[0] and b.jour >= first[2] and b.mois >= first[1]:
                    resultH += float(b.evaporation)
                if b.annee == end[0] and b.jour == end[2] and b.mois == end[1]:
                    break
            
            apport99 = ApportMComplexHansaliMassira.objects.get(freq=99)
            serializer99 = AppHansaliMassiraSerialize(apport99, many=False)
            apport98 = ApportMComplexHansaliMassira.objects.get(freq=98)
            serializer98 = AppHansaliMassiraSerialize(apport98, many=False)
            apport95 = ApportMComplexHansaliMassira.objects.get(freq=95)
            serializer95 = AppHansaliMassiraSerialize(apport95, many=False)
            apport90 = ApportMComplexHansaliMassira.objects.get(freq=90)
            serializer90 = AppHansaliMassiraSerialize(apport90, many=False)

            return Response({
                "error": False,
                "reserveResult": { "massira" : round(reserveResultM, 2), "hansali" : round(reserveResultH, 2),}, 
                "evap": {"massira" : round(resultM, 2) , "hansali" : round(resultH, 2)} ,
                "serializer99": serializer99.data,
                "serializer98": serializer98.data,
                "serializer95": serializer95.data,
                "serializer90": serializer90.data,
            })
            
        
        return Response({
            "error": False,
            "reserveResult": round(reserveResult, 2), 
            "evap": round(result, 2) ,
            "serializer99": serializer99.data,
            "serializer98": serializer98.data,
            "serializer95": serializer95.data,
            "serializer90": serializer90.data,
            })
    
    else:
        pass





def exportCSV(request, periode):
    response=HttpResponse(content_type = "text/csv")
    response['Content-Disposition']='attachement; filename=SuiviBilan' + periode + '.csv'

    writer=csv.writer(response)
    writer.writerow(["Fournitures"," d'eau","d'irrigation","realisees","au cours ","de l'annee",f"{periode}"])
    writer.writerow(["Barage", "Suivi", "Sep", "Oct", "Nov", "Dec",
                     "Jan", "Fev", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Total"])
    suivi=SuiviBilan.objects.filter(periode = periode)
    trans = TransfertMassira.objects.filter(periode=periode)
    apport = VarApport.objects.filter(periode=periode)

    
    for s in suivi:
        writer.writerow([s.barage, s.suivi, s.sep, s.oct, s.nov, s.dec,
                         s.jan, s.feb, s.mar, s.apr, s.may, s.jun, s.jul, s.aug, s.total])
    for s in trans:
        writer.writerow([s.suivi, "\t", s.sep, s.oct, s.nov, s.dec,
                         s.jan, s.feb, s.mar, s.apr, s.may, s.jun, s.jul, s.aug, s.total])
    
    for s in range(5):
        writer.writerow("\t")

    writer.writerow(["Apports"," d'eau"," enregitres ","au cours"," de l'annee ",F"{periode}"])
    for s in apport:
        writer.writerow([s.barage, "\t", s.sep, s.oct, s.nov, s.dec,
                         s.jan, s.feb, s.mar, s.apr, s.may, s.jun, s.jul, s.aug, s.total])
    return response


def exportPDF(request, periode):
    response=HttpResponse(content_type = "application/pdf")
    response['Content-Disposition']='attachement; filename=SuiviBilan' + periode + '.pdf'
    response['Content-Transfer-Encoding']='binary'

    suivi=SuiviBilan.objects.filter(periode = periode)
    trans = TransfertMassira.objects.filter(periode=periode)
    apport = VarApport.objects.filter(periode=periode)
    html_string=render_to_string(
        'barage/pdf-output.html', {'suiviBilan': suivi, 'transfert': trans, 'apport': apport, 'periode': periode})

    html=HTML(string = html_string)

    result=html.write_pdf()

    with tempfile.NamedTemporaryFile(delete = True) as output:
        output.write(result)
        output.flush()
        output=open(output.name, 'rb')
        response.write(output.read())

    return response


def exportEXCEL(request, periode):
    response=HttpResponse(content_type = "application/ms-excel")
    response['Content-Disposition']='attachement; filename=SuiviBilan' + periode + '.xls'

    wb=xlwt.Workbook(encoding = 'utf-8')
    ws=wb.add_sheet('Réalisé-Mens')

    font=xlwt.Font()
    font.height=600
    font.bold=1

    borders=xlwt.Borders()
    borders.left=1
    borders.right=1
    borders.top=1
    borders.bottom=1

    font_style=xlwt.XFStyle()
    font_style.font.bold=True
    font_style.font=font

    ws.write(0, 6, "Suivi Bilans Barrages", font_style)
    
    
    
    row_num=5

    font_style=xlwt.XFStyle()
    font_style.font.bold=True
    font_style.font.height=250
    font_style.borders=borders
    ws.write_merge(4, 4, 1, 10, F" Fournitures d'eau d'irrigation réalisées au cours  de l'année {periode}", font_style)
    columns=["Barage", "Sep", "Oct", "Nov", "Dec", "Jan",
               "Fev", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Total"]

    for col_num in range(len(columns)):
        if col_num == 0:
            ws.write_merge(row_num, row_num, col_num, col_num+1, str(columns[col_num]), font_style)
        else:
            ws.write(row_num, col_num+1, columns[col_num], font_style)

    font_style = xlwt.XFStyle()
    font_style.borders = borders

    suivi = SuiviBilan.objects.filter(periode=periode).values_list(
        "barage", "suivi", "sep", "oct", "nov", "dec", "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "total")
    trans = TransfertMassira.objects.filter(periode=periode).values_list("suivi", "sep", "oct", "nov", "dec", "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "total")
    apport = VarApport.objects.filter(periode=periode).values_list("barage", "sep", "oct", "nov", "dec", "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "total")
    for row in suivi:
        row_num += 1
        for col_num in range(len(row)):
            ws.write(row_num, col_num, row[col_num], font_style)

    for row in trans:
        row_num += 1
        for col_num in range(len(row)):
            if col_num == 0:
                ws.write_merge(row_num, row_num, col_num, col_num+1, str(row[col_num]), font_style)
            else:
                ws.write(row_num, col_num+1, row[col_num], font_style)
        
    row_num += 3
    font_style1=xlwt.XFStyle()
    font_style1.font.bold=True
    font_style1.font.height=250
    font_style1.borders=borders
    ws.write_merge(row_num, row_num, 1, 7, F"Apports d'eau enregitrés au cours de l'année {periode}", font_style1)
    font_style = xlwt.XFStyle()
    font_style.borders = borders
    font_style2=xlwt.XFStyle()
    font_style2.font.bold=True
    font_style2.borders = borders

    for row in apport:
        row_num += 1
        for col_num in range(len(row)):
            if col_num == 0:
                ws.write_merge(row_num, row_num, col_num, col_num+1, str(row[col_num]), font_style2)
            else:
                ws.write(row_num, col_num+1, row[col_num], font_style)


    wb.save(response)

    return response


def show(request):
    pass
