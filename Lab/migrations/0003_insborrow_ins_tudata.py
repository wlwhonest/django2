# Generated by Django 2.2 on 2023-09-11 07:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Lab', '0002_auto_20230911_1548'),
    ]

    operations = [
        migrations.AddField(
            model_name='insborrow',
            name='ins_tuData',
            field=models.CharField(default='暂未归还', max_length=100, verbose_name='归还时间'),
        ),
    ]
