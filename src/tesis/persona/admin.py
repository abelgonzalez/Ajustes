# -*- coding: utf-8 -*-
from django.contrib import admin
from persona.nomencladores.nomencladorPersona import Pais, Provincia, Municipio, Nacionalidad, Sexo, Etnia, \
    GradoCientifico, Ubicacion
from persona.models import Estudiante, Trabajador
from persona.nomencladores.nomencladorTrabajador import Departamento, CategoriaDocente
from persona.nomencladores.nomencladorEstudiante import Universidad, Facultad, Carrera, TipoDeCurso, CarreraTipoDeCurso
# Register your models here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User


# Define an inline admin descriptor for Persona model which acts a bit like a singleton
class TrabajadorInline(admin.StackedInline):
    model = Trabajador


# Define a new User admin
class UserAdmin(UserAdmin):
    inlines = (TrabajadorInline,)

# Re-register UserAdmin
admin.site.unregister(User)
admin.site.register(User, UserAdmin)


@admin.register(Pais)
class PaisAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Provincia)
class ProvinciaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre']


@admin.register(Municipio)
class MunicipioAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre']



@admin.register(Ubicacion)
class UbicacionAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'municipioId', 'provinciaId', 'paisId', 'activo']
    ordering = ['municipioId']
    search_fields = ['municipioId', 'activo']



@admin.register(Nacionalidad)
class NacionalidadAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Sexo)
class SexoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Etnia)
class EtniaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(GradoCientifico)
class GradoCientificoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'gradoCientifico', 'abreviatura', 'activo']
    ordering = ['gradoCientifico']
    search_fields = ['gradoCientifico', 'abreviatura', 'activo']


# De nomenclador Trabajador
@admin.register(Departamento)
class DepartamentoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(CategoriaDocente)
class CategoriaDocenteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Trabajador)
class TrabajadorAdmin(admin.ModelAdmin):
    list_filter = ['userId']
    list_display = ['pk', 'userId', 'facultadId']
    ordering = ['userId']
    search_fields = ['userId']


# De nomenclador Estudiante
@admin.register(Universidad)
class UniversidadAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'siglas', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Facultad)
class FacultadAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'siglas', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Carrera)
class CarreraAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(TipoDeCurso)
class TipoDeCursoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'siglas', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(CarreraTipoDeCurso)
class TipoDeCursoCarreraAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'universidadId', 'facultadId', 'carreraId', 'activo']
    ordering = ['universidadId']
    search_fields = ['carreraId', 'tipoCursoId']


@admin.register(Estudiante)
class EstudianteAdmin(admin.ModelAdmin):
    list_filter = ['nombre']
    list_display = ['pk', 'nombre', 'apellidos']
    ordering = ['nombre']
    search_fields = ['nombre']
