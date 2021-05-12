from typing import Set
from django.contrib.auth.models import AbstractUser
from django.db import models
from django.db.models.fields.related import ManyToManyField


# Abstract Classes.
class AbstractFournitures(models.Model):
    periode = models.CharField(max_length=20)
    month = models.CharField(max_length=4)
    year = models.IntegerField()



    class Meta:
        abstract = True


class AbstractBilanHydr(models.Model):
    annee = models.IntegerField()
    mois = models.IntegerField()
    jour = models.IntegerField()
    cote = models.FloatField()
    reserve = models.FloatField()
    varReserve = models.FloatField()
    evaporation = models.FloatField()
    fuite = models.FloatField()
    total = models.FloatField()
    appVolume = models.FloatField()
    appDebit = models.FloatField()


    class Meta:
        abstract = True


class AbstractApport(models.Model):
    freq = models.IntegerField()
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dec = models.FloatField()
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aug = models.FloatField()

    class Meta:
        abstract = True


#suivi bilan
class SuiviBilan(models.Model):
    periode = models.CharField(max_length=20)
    barage = models.CharField(max_length=40)
    suivi = models.CharField(max_length=40)
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dec = models.FloatField()
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aug = models.FloatField()
    total = models.FloatField()

class TransfertMassira(models.Model):
    periode = models.CharField(max_length=20)
    suivi = models.CharField(max_length=40)
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dec = models.FloatField()
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aug = models.FloatField()
    total = models.FloatField()


    
#user and barages classes

class Barrages(models.Model):
    name = models.CharField(max_length=100) 


#apport des barrages

class ApportMComplexHansaliMassira(AbstractApport):
    pass

class ApportMBinouidane(AbstractApport):
    pass

class ApportMmoulayYoussef(AbstractApport):
    pass

class ApportMHassanPrem(AbstractApport):
    pass


#Apport au cours de cette annee

class VarApport(models.Model):
    periode = models.CharField(max_length=20)
    barage = models.CharField(max_length=40)
    sep = models.FloatField()
    oct = models.FloatField()
    nov = models.FloatField()
    dec = models.FloatField()
    jan = models.FloatField()
    feb = models.FloatField()
    mar = models.FloatField()
    apr = models.FloatField()
    may = models.FloatField()
    jun = models.FloatField()
    jul = models.FloatField()
    aug = models.FloatField()
    total = models.FloatField()

#fourniture

class BinOuidaneFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    turbinageAfourer = models.FloatField()
    irrigation = models.FloatField()
    aepiBm = models.FloatField()
    vidPdev = models.FloatField()
    TransfertMassira = models.FloatField()
    aport = models.FloatField()

class HassanPremFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    aepiAzDem = models.FloatField()
    vidPdev = models.FloatField()
    TransfertMassira = models.FloatField()
    aport = models.FloatField()

class SidiDrissFornitures(AbstractFournitures):
    Canal = models.FloatField()
    pmh = models.FloatField()
    vidPdev = models.FloatField()

class MyYoussefFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    irrigation = models.FloatField()
    soltania = models.FloatField()
    vidPdev = models.FloatField()
    TransfertMassira = models.FloatField()
    aport = models.FloatField()



class AelHanssaliFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    vidPdev = models.FloatField()
    TransfertMassira = models.FloatField()
    aport = models.FloatField()


class AitMessaoudFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    irrigation = models.FloatField()
    aepi = models.FloatField()
    vidPdev = models.FloatField()

class MassiraFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    aepiRhamna = models.FloatField()
    aepiKech = models.FloatField()
    vidPdev = models.FloatField()
    aport = models.FloatField()

class ImfoutFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    irrigation = models.FloatField()
    aepSidiBenourZemamra = models.FloatField()
    aepONEPDoukkala = models.FloatField()
    vidPdev = models.FloatField()

class DaourateFornitures(AbstractFournitures):
    turbinage = models.FloatField()
    aep = models.FloatField()
    vidPdev = models.FloatField()

class SSMaachouFornitures(AbstractFournitures):
    aep = models.FloatField()
    vidPdev = models.FloatField()

class SidiDaouiFornitures(AbstractFournitures):
    aepAzemour = models.FloatField()

class DigueSafiFornitures(AbstractFournitures):
    aep = models.FloatField()
    vidPdev = models.FloatField()







#bilan hydraulique


class BinOuidaneBilanHydr(AbstractBilanHydr):
    volumeTurbine = models.FloatField()
    evc = models.FloatField()
    vf = models.FloatField()
    volumeLache = models.FloatField()

class HassanPremBilanHydr(AbstractBilanHydr):
    onep = models.FloatField()
    one = models.FloatField()
    vidFond = models.FloatField()
    eCrue = models.FloatField()

class SidiDrissBilanHydr(AbstractBilanHydr):
    oued = models.FloatField()
    canal = models.FloatField()
    vidFond = models.FloatField()
    Desverse = models.FloatField()

class MyYoussefBilanHydr(AbstractBilanHydr):
    evc = models.FloatField()
    v = models.FloatField()
    c = models.FloatField()
    one = models.FloatField()
    vf = models.FloatField()


class TiminoutineBilanHydr(models.Model):
    annee = models.IntegerField()
    mois = models.IntegerField()
    jour = models.IntegerField()
    cote = models.FloatField()
    reserve = models.FloatField()
    varReserve = models.FloatField()
    evaporation = models.FloatField()
    vidange = models.FloatField()
    deverse = models.FloatField()
    v1 = models.FloatField()
    v2 = models.FloatField()
    soltania = models.FloatField()
    total = models.FloatField()
    volumeApp = models.FloatField()
    debitApp = models.FloatField()

class AelHanssaliBilanHydr(AbstractBilanHydr):
    volumeTurbine = models.FloatField()
    vsd = models.FloatField()
    vsg = models.FloatField()
    vDesverse = models.FloatField()

class AitMessaoudBilanHydr(AbstractBilanHydr):
    tauxRemplissage = models.FloatField()
    volumeTurbine = models.FloatField()
    vVidange = models.FloatField()
    vEvacue = models.FloatField()
    pluie = models.FloatField()

class MassiraBilanHydr(AbstractBilanHydr):
    one = models.FloatField()
    onep1 = models.FloatField()
    onpe2 = models.FloatField()
    vFond = models.FloatField()
    evacCrue = models.FloatField()



class BarageUploaded(models.Model):
    name = models.CharField(max_length=40)
    month = models.IntegerField()
    year = models.IntegerField()

