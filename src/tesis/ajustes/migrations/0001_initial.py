# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AjusteAsignatura',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Ajuste de asignatura',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Ajustes de asignaturas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AjusteAsignaturaConvalidada',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Ajuste de asignatura convalidada',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Ajuste de asignaturas convalidadas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AjusteEstudiante',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Estudiante - Motivo de ajuste',
                'default_permissions': ('add', 'change', 'delete', 'view', 'approve'),
                'verbose_name_plural': 'Estudiante - Motivo de ajuste',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AprobacionDeAjuste',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('fecha', models.DateTimeField(auto_now=True)),
                ('comentarios', models.CharField(verbose_name='Comentarios', blank=True, max_length=300, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('ajusteEstudianteId', models.ForeignKey(verbose_name='Propuesta de ajuste', to='ajustes.AjusteEstudiante', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'Aprobaci??n de ajuste',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Aprobaci??n de ajustes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='DocumentacionAnalizada',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre del documento', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Documentaci??n analizada',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Documentaci??n analizada',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='EstadoAjuste',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre del estado', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Estado de ajuste',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Estados de ajustes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='MotivoAjuste',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre del motivo', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Motivo de ajuste',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Motivos de ajuste',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Situacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre de la situaci??n', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Situaci??n de la asignatura',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Situaciones de asignaturas',
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='situacion',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='motivoajuste',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='estadoajuste',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='documentacionanalizada',
            unique_together=set([('nombre', 'activo')]),
        ),
    ]
