from django.db import models
from django.core.urlresolvers import reverse
from django.shortcuts import render, render_to_response, get_object_or_404
from planEstudio.nomencladores.nomencladorPlanEstudio import PlanEstudio as PlanEstudio
from planEstudio.nomencladores.nomencladorPlanEstudio import Anho as Anho
from planEstudio.nomencladores.nomencladorPlanEstudio import Curso as Curso
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre as AnhoSemestre
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import Asignatura as Asignatura
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import TipoAsignatura as TipoAsignatura
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import Disciplina as Disciplina
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import Curriculo as Curriculo
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import TipoEvaluacion as TipoEvaluacion
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso as CarreraTipoDeCurso
from persona.nomencladores.nomencladorTrabajador import Departamento as Departamento
from persona.models import Estudiante


class Cohorte(models.Model):
    """
Nomenclador de Cohortes .
Ejemplos: (está muy largo como para ponerse a explicar)
@cvar carreraTipoCursoId: Representa la relación de 1:M con la tabla CarreraTipoDeCurso .
@cvar planEstudioId: Representa la relación de 1:M con la tabla PlanEstudio.
@cvar cursoId: Representa la relación de 1:M con la tabla Curso. 
@cvar comentario: Representa un comentario del cohorte.
@cvar activo: Valor booleano que representa si un Cohorte está activo o no para ser usado en la aplicación.
"""
    carreraTipoCursoId = models.ForeignKey(CarreraTipoDeCurso, verbose_name='Tipo de curso - carrera')
    planEstudioId = models.ForeignKey(PlanEstudio, verbose_name='Plan de estudio')
    cursoId = models.ForeignKey(Curso, verbose_name='Curso de activacion')
    comentario = models.TextField('Comentario', max_length=150, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Cohorte'
        verbose_name_plural = 'Cohortes'
        unique_together = ('carreraTipoCursoId', 'planEstudioId', 'cursoId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s %s [%s]" % (self.carreraTipoCursoId, self.planEstudioId, self.cursoId)

    def get_absolute_url(self):
        return reverse('planEstudio:cohorte_detalle', kwargs={'pk': self.pk})

    def eliminar(self):  # TODO esto de veras hace falta????
        object = get_object_or_404(Cohorte, pk=self.pk)
        object.activo = False
        object.save()
        return reverse('planEstudio:cohorte_listar')


class CarreraEstudiante(models.Model):
    """
Nomenclador de Carreras de un Estudiante.
Ejemplos: Abel González Mondéjar-Ingeniería Informática, Romualdo Arrechea Hernández-Ingeniería Informática.

@cvar cohorteId: Relación 1:M con Cohorte.
@cvar estudianteId: Relación 1:M con Estudiante.
@cvar fechaIngreso: Representa la fecha de ingreso de ese estudiante a esa carrera.
@cvar activo: Valor booleano que representa si la carrera de un estudiante está activa o no para ser usada en el sistema
"""
    estudianteId = models.ForeignKey(Estudiante, verbose_name='Estudiante')
    cohorteId = models.ForeignKey(Cohorte, verbose_name='Carrera Tipo de Curso Plan estudio')
    fechaIngreso = models.DateField('Fecha de ingreso', auto_now=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Carrera - Estudiante'
        verbose_name_plural = 'Carreras - Estudiantes'
        unique_together = ('cohorteId', 'estudianteId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s (%s)" % (self.estudianteId, self.cohorteId)


class AsignaturaCohorte(models.Model):
    """
Nomenclador de las Asignaturas de un Cohorte.
Ejemplos: (está muy largo como para ponerse a explicar)
@cvar cantidadHoras: Representa la cantidad de horas que tiene una asignatura dentro de un cohorte.
@cvar comentario: Representa un comentario con respecto a las asignaturas de un cohorte.
@cvar anhoSemestreId: Representa la relacion 1:M con la tabla AnhoSemestre.
@cvar asignaturaId: Representa la relacion 1:M con la tabla Asignatura.
@cvar tipoAsignaturaId: Representa la relacion 1:M con la tabla TipoAsignatura.
@cvar disciplinaId: Representa la relacion 1:M con la tabla Disciplina.
@cvar curriculoId = Representa la relacion 1:M con la tabla Curriculo.
@cvar tipoEvauacionId: Representa la relacion 1:M con la tabla TipoEvaluacion.
@cvar cohorteId: Representa la relacion 1:M con la tabla Cohorte.
@cvar activo: Valor booleano que representa si la asignatura de un cohorte está activa o no para ser usada en la aplicación.
"""
    asignaturaId = models.ForeignKey(Asignatura, verbose_name='Asignatura')
    cohorteId = models.ForeignKey(Cohorte, verbose_name='Carrera-TipoCurso-PlanEstudio')
    anhoSemestreId = models.ForeignKey(AnhoSemestre, verbose_name='Año-Semestre')
    cantidadHorasS = models.IntegerField('Cantidad de horas semanales', default=8)
    cantidadHorasT = models.IntegerField('Cantidad de horas totales', default=80)
    tipoAsignaturaId = models.ForeignKey(TipoAsignatura, verbose_name='Tipo de asignatura', blank=True, null=True)
    disciplinaId = models.ForeignKey(Disciplina, verbose_name='Disciplina', blank=True, null=True)
    curriculoId = models.ForeignKey(Curriculo, verbose_name='Curriculo', blank=True, null=True)
    tipoEvauacionId = models.ForeignKey(TipoEvaluacion, verbose_name='Tipo de Evaluacion', blank=True, null=True)
    comentario = models.TextField('Comentario', max_length=150, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Asignatura de un cohorte'
        verbose_name_plural = 'Asignaturas de un cohorte'
        unique_together = ('asignaturaId', 'cohorteId')

        default_permissions = ('add', 'change', 'delete', 'view')


    def __str__(self):
        return u"%s - %s (%s)" % (self.asignaturaId, self.anhoSemestreId, self.cohorteId)


def get_absolute_url(self):
    return reverse('planEstudio:asignaturacohorte_detalle', kwargs={'pk': self.pk})


def eliminar(self):  # TODO it's really necesary????
    object = get_object_or_404(AsignaturaCohorte, pk=self.pk)
    object.activo = False
    object.save()
    return reverse('planEstudio:asignaturacohorte_listar')


class AsignaturaVencida(models.Model):
    """
Nomenclador de Asignaturas Vencidas
Ejemplos:  El estudiante Romualdo Arrechea venció Matemática Discreta en la carrera de Ingenieria Informatica en la UNAH.
@cvar carreraEstudianteId: Representa la relacion 1:M con la tabla CarreraEstudiante.
@cvar asignaturaCohorteId: Representa la relacion 1:M con la tabla AsignaturaCohorte.
@cvar activo: Valor booleano que representa si una asignatura vencida está activa o no para ser usado en la aplicación.
    """
    carreraEstudianteId = models.ForeignKey(CarreraEstudiante, verbose_name='Carrera Estudiante', blank=True, null=True)
    asignaturaCohorteId = models.ForeignKey(AsignaturaCohorte, verbose_name='Asignatura', blank=True, null=True)
    comentario = models.TextField('Comentario', max_length=150, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)


    class Meta:
        verbose_name = 'Asignatura vencida del estudiante'
        verbose_name_plural = 'Asignaturas vencidas de los estudiantes a ajustar'
        unique_together = ('carreraEstudianteId', 'asignaturaCohorteId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        a = self.carreraEstudianteId
        b = self.asignaturaCohorteId
        return u"%s (%s)" % (self.carreraEstudianteId, self.asignaturaCohorteId)


class AsignaturaOptativaElectiva(models.Model):  # TODO
    """
Nomenclador de Asignaturas Vencidas
Ejemplos:  El estudiante Romuelado Rechea venció Matemática Discreta en la carrera de Ingenieria Informatica en la UNAH.
@cvar carreraEstudianteId: Representa la relacion 1:M con la tabla CarreraEstudiante.
@cvar asignaturaCohorteId: Representa la relacion 1:M con la tabla AsignaturaCohorte.
@cvar activo: Valor booleano que representa si una asignatura vencida está activa o no para ser usado en la aplicación.
    """
    asignaturaId = models.ForeignKey(Asignatura,
                                     verbose_name='Asignatura')  # models.CharField('Nombre de la asignatura', max_length=80)
    asignaturaCohorteId = models.ForeignKey(AsignaturaCohorte, verbose_name='Optativa/Electiva a la que pertenece')
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Asignatura optativa/electiva'
        verbose_name_plural = 'Asignaturas optativas/electivas'
        unique_together = ('asignaturaId', 'asignaturaCohorteId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s => %s" % (self.asignaturaId, self.asignaturaCohorteId)
