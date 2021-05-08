# Generated by Django 3.2 on 2021-04-30 11:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('barage', '0005_suivibilan'),
    ]

    operations = [
        migrations.CreateModel(
            name='TransfertMassira',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('periode', models.CharField(max_length=20)),
                ('suivi', models.CharField(max_length=40)),
                ('sep', models.FloatField()),
                ('oct', models.FloatField()),
                ('nov', models.FloatField()),
                ('dec', models.FloatField()),
                ('jan', models.FloatField()),
                ('feb', models.FloatField()),
                ('mar', models.FloatField()),
                ('apr', models.FloatField()),
                ('may', models.FloatField()),
                ('jun', models.FloatField()),
                ('jul', models.FloatField()),
                ('aug', models.FloatField()),
                ('total', models.FloatField()),
            ],
        ),
    ]
