from django.db.models import fields
from rest_framework import serializers
from .models import *

class BarragesSerialize(serializers.ModelSerializer):
    class Meta:
        model = Barrages
        fields = '__all__'


class suiviBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = SuiviBilan
        fields = '__all__'

class TransfertSerialize(serializers.ModelSerializer):
    class Meta:
        model = TransfertMassira
        fields = '__all__'
#apport des barrages

class AppHansaliMassiraSerialize(serializers.ModelSerializer):
    class Meta:
        model = ApportMComplexHansaliMassira
        fields = '__all__'

class AppBinouidaneSerialize(serializers.ModelSerializer):
    class Meta:
        model = ApportMBinouidane
        fields = '__all__'

class AppmoulayYoussefSerialize(serializers.ModelSerializer):
    class Meta:
        model = ApportMmoulayYoussef
        fields = '__all__'

class AppMHassanPremSerialize(serializers.ModelSerializer):
    class Meta:
        model = ApportMHassanPrem
        fields = '__all__'


#Apport au cours de cette annee

class VarApportSerialize(serializers.ModelSerializer):
    class Meta:
        model = VarApport
        fields = '__all__'

#fourniture

class BinOuidaneFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = BinOuidaneFornitures
        fields = '__all__'

class HassanPremFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = HassanPremFornitures
        fields = '__all__'


class SidiDrissFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = SidiDrissFornitures
        fields = '__all__'


class MyYoussefFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = MyYoussefFornitures
        fields = '__all__'


class AelHanssaliFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = AelHanssaliFornitures
        fields = '__all__'



class AitMessaoudFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = AitMessaoudFornitures
        fields = '__all__'


class MassiraFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = MassiraFornitures
        fields = '__all__'


class ImfoutFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = ImfoutFornitures
        fields = '__all__'


class DaourateFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = DaourateFornitures
        fields = '__all__'


class SSMaachouFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = SSMaachouFornitures
        fields = '__all__'


class SidiDaouiFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = SidiDaouiFornitures
        fields = '__all__'


class DigueSafiFornSerialize(serializers.ModelSerializer):
    class Meta:
        model = DigueSafiFornitures
        fields = '__all__'








#bilan Serializeaulique


class BinOuidaneBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = BinOuidaneBilanHydr
        fields = '__all__'

class HassanPremBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = HassanPremBilanHydr
        fields = '__all__'

class SidiDrissBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = SidiDrissBilanHydr
        fields = '__all__'

class MyYoussefBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = MyYoussefBilanHydr
        fields = '__all__'

class AelHanssaliBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = AelHanssaliBilanHydr
        fields = '__all__'

class AitMessaoudBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = AitMessaoudBilanHydr
        fields = '__all__'

class MassiraBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = MassiraBilanHydr
        fields = '__all__'

class TiminoutineBilanSerialize(serializers.ModelSerializer):
    class Meta:
        model = TiminoutineBilanHydr
        fields = '__all__'



