# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('persona', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Anho',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Anho', max_length=80)),
                ('abreviatura', models.CharField(verbose_name='Abreviatura', max_length=20)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Anho',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Anhos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AnhoSemestre',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('anhoId', models.ForeignKey(verbose_name='Anho', to='planEstudio.Anho')),
            ],
            options={
                'verbose_name': 'Semestre de un anho',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Semestres de un anho',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Asignatura',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=100)),
                ('abreviatura', models.CharField(verbose_name='Abreviatura', blank=True, max_length=10, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Asignatura',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Asignaturas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AsignaturaCohorte',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('cantidadHorasS', models.IntegerField(verbose_name='Cantidad de horas semanales', default=8)),
                ('cantidadHorasT', models.IntegerField(verbose_name='Cantidad de horas totales', default=80)),
                ('comentario', models.TextField(verbose_name='Comentario', blank=True, max_length=150, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('anhoSemestreId', models.ForeignKey(verbose_name='Año-Semestre', to='planEstudio.AnhoSemestre')),
                ('asignaturaId', models.ForeignKey(verbose_name='Asignatura', to='planEstudio.Asignatura')),
            ],
            options={
                'verbose_name': 'Asignatura de un cohorte',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Asignaturas de un cohorte',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AsignaturaOptativaElectiva',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('asignaturaCohorteId', models.ForeignKey(verbose_name='Optativa/Electiva a la que pertenece', to='planEstudio.AsignaturaCohorte')),
                ('asignaturaId', models.ForeignKey(verbose_name='Asignatura', to='planEstudio.Asignatura')),
            ],
            options={
                'verbose_name': 'Asignatura optativa/electiva',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Asignaturas optativas/electivas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AsignaturaVencida',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('comentario', models.TextField(verbose_name='Comentario', blank=True, max_length=150, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('asignaturaCohorteId', models.ForeignKey(verbose_name='Asignatura', to='planEstudio.AsignaturaCohorte', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'Asignatura vencida del estudiante',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Asignaturas vencidas de los estudiantes a ajustar',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CarreraEstudiante',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('fechaIngreso', models.DateField(auto_now=True, verbose_name='Fecha de ingreso')),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Carrera - Estudiante',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Carreras - Estudiantes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Cohorte',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('comentario', models.TextField(verbose_name='Comentario', blank=True, max_length=150, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('carreraTipoCursoId', models.ForeignKey(verbose_name='Tipo de curso - carrera', to='persona.CarreraTipoDeCurso')),
            ],
            options={
                'verbose_name': 'Cohorte',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Cohortes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Curriculo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Currículo',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Currículos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Curso',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Curso', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Curso',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Curso',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Disciplina',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Disciplina',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Disciplinas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='PlanEstudio',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=50)),
                ('cantidadPeriodos', models.IntegerField(verbose_name='Cantidad de períodos', default=10)),
                ('comentarios', models.TextField(verbose_name='Comentario', blank=True, max_length=100)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Plan de estudio',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Planes de estudio',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Semestre',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Semestre', max_length=80)),
                ('abreviatura', models.CharField(verbose_name='Abreviatura', blank=True, max_length=20, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Semestre',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Semestre',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TipoAsignatura',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Tipo de asignatura',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Tipos de asignaturas',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TipoEvaluacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Nombre', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Tipo de evaluación',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Tipos de evaluaciones',
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='tipoevaluacion',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='tipoasignatura',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='semestre',
            unique_together=set([('nombre', 'abreviatura')]),
        ),
        migrations.AlterUniqueTogether(
            name='planestudio',
            unique_together=set([('nombre', 'cantidadPeriodos')]),
        ),
        migrations.AlterUniqueTogether(
            name='disciplina',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='curso',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='curriculo',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AddField(
            model_name='cohorte',
            name='cursoId',
            field=models.ForeignKey(verbose_name='Curso de activacion', to='planEstudio.Curso'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='cohorte',
            name='planEstudioId',
            field=models.ForeignKey(verbose_name='Plan de estudio', to='planEstudio.PlanEstudio'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='cohorte',
            unique_together=set([('carreraTipoCursoId', 'planEstudioId', 'cursoId')]),
        ),
        migrations.AddField(
            model_name='carreraestudiante',
            name='cohorteId',
            field=models.ForeignKey(verbose_name='Carrera Tipo de Curso Plan estudio', to='planEstudio.Cohorte'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='carreraestudiante',
            name='estudianteId',
            field=models.ForeignKey(verbose_name='Estudiante', to='persona.Estudiante'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='carreraestudiante',
            unique_together=set([('cohorteId', 'estudianteId')]),
        ),
        migrations.AddField(
            model_name='asignaturavencida',
            name='carreraEstudianteId',
            field=models.ForeignKey(verbose_name='Carrera Estudiante', to='planEstudio.CarreraEstudiante', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='asignaturavencida',
            unique_together=set([('carreraEstudianteId', 'asignaturaCohorteId')]),
        ),
        migrations.AlterUniqueTogether(
            name='asignaturaoptativaelectiva',
            unique_together=set([('asignaturaId', 'asignaturaCohorteId')]),
        ),
        migrations.AddField(
            model_name='asignaturacohorte',
            name='cohorteId',
            field=models.ForeignKey(verbose_name='Carrera-TipoCurso-PlanEstudio', to='planEstudio.Cohorte'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asignaturacohorte',
            name='curriculoId',
            field=models.ForeignKey(verbose_name='Curriculo', to='planEstudio.Curriculo', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asignaturacohorte',
            name='disciplinaId',
            field=models.ForeignKey(verbose_name='Disciplina', to='planEstudio.Disciplina', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asignaturacohorte',
            name='tipoAsignaturaId',
            field=models.ForeignKey(verbose_name='Tipo de asignatura', to='planEstudio.TipoAsignatura', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='asignaturacohorte',
            name='tipoEvauacionId',
            field=models.ForeignKey(verbose_name='Tipo de Evaluacion', to='planEstudio.TipoEvaluacion', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='asignaturacohorte',
            unique_together=set([('asignaturaId', 'cohorteId')]),
        ),
        migrations.AlterUniqueTogether(
            name='asignatura',
            unique_together=set([('nombre', 'abreviatura')]),
        ),
        migrations.AddField(
            model_name='anhosemestre',
            name='semestreId',
            field=models.ForeignKey(verbose_name='Semestre', to='planEstudio.Semestre'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='anhosemestre',
            unique_together=set([('anhoId', 'semestreId')]),
        ),
        migrations.AlterUniqueTogether(
            name='anho',
            unique_together=set([('nombre', 'abreviatura')]),
        ),
    ]
