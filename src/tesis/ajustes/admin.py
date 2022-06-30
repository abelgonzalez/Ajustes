from django.contrib import admin
from ajustes.nomencladores.nomencladorAjuste import MotivoAjuste, DocumentacionAnalizada, Situacion, EstadoAjuste
from ajustes.models import AjusteEstudiante, AjusteAsignatura, AjusteAsignaturaConvalidada, AprobacionDeAjuste
# Register your models here.


@admin.register(EstadoAjuste)
class EstadoAjusteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['id']
    search_fields = ['nombre', 'activo']


@admin.register(MotivoAjuste)
class MotivoAjusteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(DocumentacionAnalizada)
class DocumentacionAnalizadaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Situacion)
class SituacionAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(AjusteEstudiante)
class AjusteEstudianteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'carreraEstudianteId', 'motivoAjusteId', 'cursoAjusteId']
    ordering = ['carreraEstudianteId']
    search_fields = ['motivoAjusteId', 'activo']


@admin.register(AjusteAsignatura)
class AjusteAsignaturaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'ajusteEstudianteId', 'situacionId', 'asignaturaCohorteId', ]
    ordering = ['ajusteEstudianteId']
    search_fields = ['ajusteEstudianteId', 'activo']


@admin.register(AjusteAsignaturaConvalidada)
class AjusteAsignaturaConvalidadaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'ajusteAsignaturaId']
    ordering = ['ajusteAsignaturaId']
    search_fields = ['ajusteAsignaturaId', 'activo']


@admin.register(AprobacionDeAjuste)
class AprobacionDeAjusteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'trabajadorId', 'carreraEstId', 'ajusteEstudianteId', 'estadoId', 'fecha']
    ordering = ['fecha']
    search_fields = ['trabajadorId', 'activo']

