# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ajustes', '0002_auto_20150322_0057'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ajusteestudiante',
            name='cohortePropuestoId',
            field=models.ForeignKey(blank=True, null=True, verbose_name='Cohorte ajustado', to='planEstudio.Cohorte'),
            preserve_default=True,
        ),
    ]
