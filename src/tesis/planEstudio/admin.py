from django.contrib import admin
from planEstudio.nomencladores.nomencladorPlanEstudio import Curso, Anho, Semestre, AnhoSemestre, PlanEstudio
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import Asignatura, TipoAsignatura, Disciplina, Curriculo, \
    TipoEvaluacion
from planEstudio.models import Cohorte, AsignaturaCohorte, AsignaturaVencida, CarreraEstudiante, \
    AsignaturaOptativaElectiva

# Register your models here.


@admin.register(Curso)
class CursoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Anho)
class AnhoAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'abreviatura', 'activo']
    ordering = ['abreviatura']
    search_fields = ['nombre', 'activo']


@admin.register(Semestre)
class SemestreAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(AnhoSemestre)
class CursoSemestreAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'anhoId', 'semestreId', 'activo']
    ordering = ['anhoId']
    search_fields = ['anhoId', 'activo']


@admin.register(Asignatura)
class AsignaturaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'abreviatura', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(TipoAsignatura)
class TipoAsignaturaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Disciplina)
class DisciplinaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Curriculo)
class DisciplinaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(TipoEvaluacion)
class TipoEvaluacionAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(PlanEstudio)
class PlanEstudioAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'nombre', 'activo']
    ordering = ['nombre']
    search_fields = ['nombre', 'activo']


@admin.register(Cohorte)
class CohorteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'carreraTipoCursoId', 'planEstudioId', 'cursoId', 'activo']
    ordering = ['planEstudioId']
    search_fields = ['planEstudioId', 'tipoCursoCarreraId']


@admin.register(AsignaturaCohorte)
class AsignaturaCohorteAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'asignaturaId', 'anhoSemestreId', 'cohorteId', 'activo']
    ordering = ['asignaturaId']
    search_fields = ['asignaturaId', 'tipoCursoCarreraId']


@admin.register(AsignaturaVencida)
class AsignaturaVencidaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'asignaturaCohorteId', 'carreraEstudianteId', 'activo']
    ordering = ['asignaturaCohorteId']
    search_fields = ['carreraEstudianteId', 'asignaturaCohorteId']


@admin.register(CarreraEstudiante)
class CarreraEstudianteAdmin(admin.ModelAdmin):
    list_filter = ['cohorteId']
    list_display = ['pk', 'cohorteId', 'estudianteId']
    ordering = ['cohorteId']
    search_fields = ['estudianteId']


@admin.register(AsignaturaOptativaElectiva)
class AsignaturaOptativaElectivaAdmin(admin.ModelAdmin):
    list_filter = ['activo']
    list_display = ['pk', 'asignaturaId', 'asignaturaCohorteId', 'activo']
    ordering = ['asignaturaCohorteId']
    search_fields = ['nombre', 'activo']