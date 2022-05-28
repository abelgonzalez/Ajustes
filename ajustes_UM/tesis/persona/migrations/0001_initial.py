# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Carrera', max_length=80)),
                ('siglas', models.CharField(verbose_name='Siglas', blank=True, max_length=10, null=True)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Carrera',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Carreras',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CarreraTipoDeCurso',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('cantidadAnhos', models.IntegerField(verbose_name='Cantidad de años', default=5)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('carreraId', models.ForeignKey(verbose_name='Carrera', to='persona.Carrera')),
            ],
            options={
                'verbose_name': 'Tipo de curso en carrera',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Tipos de cursos en Carreras',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CategoriaDocente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Categoría docente', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Categoría docente',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Categorías docentes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Departamento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Departamento', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Departamento',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Departamentos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('carneIdentidad', models.CharField(unique=True, verbose_name='Carné de identidad', max_length=11)),
                ('nombre', models.CharField(verbose_name='Nombre del estudiante', max_length=50)),
                ('apellidos', models.CharField(verbose_name='Apellidos', max_length=80)),
                ('direccion', models.TextField(verbose_name='Dirección', max_length=100)),
                ('correoElectronico', models.EmailField(verbose_name='Correo electrónico', blank=True, max_length=50, null=True)),
                ('fechaIngESup', models.DateField(auto_now=True, verbose_name='Fecha de ingreso a la Educación Superior')),
                ('indiceAcademico', models.DecimalField(max_digits=5, verbose_name='Indice académico', decimal_places=2)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Estudiante',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Estudiantes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Etnia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Etnia', max_length=80)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Etnia',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Etnias',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Facultad',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Facultad', max_length=80)),
                ('siglas', models.CharField(verbose_name='Siglas', max_length=10)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Facultad',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Facultades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='GradoCientifico',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('gradoCientifico', models.CharField(unique=True, verbose_name='Grado científico', max_length=80)),
                ('abreviatura', models.CharField(verbose_name='Abreviatura', max_length=5)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Grado científico',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Grados científicos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Municipio',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(verbose_name='Municipio', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Municipio',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Municipios',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Nacionalidad',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(verbose_name='Nacionalidad', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Nacionalidad',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Nacionalidades',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Pais',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(verbose_name='País', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'País',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Países',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Provincia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(verbose_name='Provincia', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Provincia',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Provincias',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Sexo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(verbose_name='Sexo', max_length=50)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Sexo',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Sexos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TipoDeCurso',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Tipo de curso', max_length=80)),
                ('siglas', models.CharField(verbose_name='Siglas', max_length=10)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Tipo de curso',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Tipos de cursos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Trabajador',
            fields=[
                ('userId', models.OneToOneField(verbose_name='Usuario', serialize=False, to=settings.AUTH_USER_MODEL, primary_key=True)),
                ('comentario', models.TextField(verbose_name='Comentarios', blank=True, max_length=100)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('categoriaDocenteId', models.ForeignKey(verbose_name='Categoria docente', to='persona.CategoriaDocente', null=True, blank=True)),
                ('departamentoId', models.ForeignKey(verbose_name='Departamento', to='persona.Departamento', null=True, blank=True)),
                ('facultadId', models.ForeignKey(verbose_name='Facultad', to='persona.Facultad')),
                ('gradoCientifico', models.ForeignKey(verbose_name='Grado Científico', to='persona.GradoCientifico', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'Trabajador',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Trabajadores',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Ubicacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
                ('municipioId', models.ForeignKey(verbose_name='Municipio', to='persona.Municipio')),
                ('paisId', models.ForeignKey(verbose_name='País', to='persona.Pais')),
                ('provinciaId', models.ForeignKey(verbose_name='Provincia', to='persona.Provincia')),
            ],
            options={
                'verbose_name': 'Ubicación',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Ubicaciones',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Universidad',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('nombre', models.CharField(unique=True, verbose_name='Universidad', max_length=80)),
                ('siglas', models.CharField(verbose_name='Siglas', max_length=10)),
                ('activo', models.BooleanField(verbose_name='Activo', default=True)),
            ],
            options={
                'verbose_name': 'Universidad',
                'default_permissions': ('add', 'change', 'delete', 'view'),
                'verbose_name_plural': 'Universidades',
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='universidad',
            unique_together=set([('nombre', 'siglas')]),
        ),
        migrations.AlterUniqueTogether(
            name='ubicacion',
            unique_together=set([('paisId', 'provinciaId', 'municipioId')]),
        ),
        migrations.AlterUniqueTogether(
            name='tipodecurso',
            unique_together=set([('nombre', 'siglas')]),
        ),
        migrations.AlterUniqueTogether(
            name='sexo',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='provincia',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='pais',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='nacionalidad',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='municipio',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='gradocientifico',
            unique_together=set([('gradoCientifico', 'abreviatura')]),
        ),
        migrations.AlterUniqueTogether(
            name='facultad',
            unique_together=set([('nombre', 'siglas')]),
        ),
        migrations.AlterUniqueTogether(
            name='etnia',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AddField(
            model_name='estudiante',
            name='etniaId',
            field=models.ForeignKey(verbose_name='Etnia', to='persona.Etnia', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='estudiante',
            name='nacionalidadId',
            field=models.ForeignKey(verbose_name='Nacionalidad', to='persona.Nacionalidad', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='estudiante',
            name='sexoId',
            field=models.ForeignKey(verbose_name='Sexo', to='persona.Sexo', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='estudiante',
            name='ubicacionId',
            field=models.ForeignKey(verbose_name='Ubicación', to='persona.Ubicacion'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='estudiante',
            unique_together=set([('carneIdentidad', 'nombre', 'apellidos')]),
        ),
        migrations.AlterUniqueTogether(
            name='departamento',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AlterUniqueTogether(
            name='categoriadocente',
            unique_together=set([('nombre', 'activo')]),
        ),
        migrations.AddField(
            model_name='carreratipodecurso',
            name='facultadId',
            field=models.ForeignKey(verbose_name='Facultad', to='persona.Facultad'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='carreratipodecurso',
            name='tipoCursoId',
            field=models.ForeignKey(verbose_name='Tipo de curso', to='persona.TipoDeCurso'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='carreratipodecurso',
            name='universidadId',
            field=models.ForeignKey(verbose_name='Universidad', to='persona.Universidad'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='carreratipodecurso',
            unique_together=set([('universidadId', 'facultadId', 'carreraId', 'tipoCursoId')]),
        ),
        migrations.AlterUniqueTogether(
            name='carrera',
            unique_together=set([('nombre', 'siglas')]),
        ),
    ]
