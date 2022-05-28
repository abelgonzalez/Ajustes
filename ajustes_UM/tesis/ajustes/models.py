# -*- coding: utf-8 -*-
from django.db import models
from ajustes.nomencladores.nomencladorAjuste import MotivoAjuste, DocumentacionAnalizada, Situacion, EstadoAjuste
from persona.nomencladores.nomencladorEstudiante import Universidad
from persona.models import Estudiante, Trabajador
from planEstudio.models import AsignaturaCohorte, AsignaturaVencida, Cohorte, CarreraEstudiante
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre, Curso
# Create your models here.


class AjusteEstudiante(models.Model):
    """
Nomenclador de Ajustes para Estudiantes .
Ejemplos: (muy largo de explicar)
@cvar carreraEstudianteId: Relación 1:M con CarreraEstudiante.
@cvar motivoAjusteId: Relación 1:M con  MotivoAjuste.
@cvar documentacionAnalizadaId: Relación 1:M con DocumentacionAnalizada.
@cvar cursoId: Relación 1:M con Curso.
@cvar anhoSemestreId: Relación 1:M con AnhoSemestre.
@cvar activo: Valor booleano que representa si un ajuste a un estudiante es activo o no. 
"""
    carreraEstudianteId = models.ForeignKey(CarreraEstudiante, verbose_name="Estudiante")
    motivoAjusteId = models.ForeignKey(MotivoAjuste, verbose_name='Motivo de ajuste')
    documentacionAnalizadaId = models.ForeignKey(DocumentacionAnalizada, verbose_name='Documentación analizada')
    cursoAjusteId = models.ForeignKey(Curso, verbose_name='Curso en que se realiza el ajuste')
    cohortePropuestoId = models.ForeignKey(Cohorte, verbose_name='Cohorte ajustado', blank=True, null=True)
    anhoSemestreAjustadoId = models.ForeignKey(AnhoSemestre, verbose_name='Año y semestre ajustado', blank=True,
                                               null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Estudiante - Motivo de ajuste'
        verbose_name_plural = 'Estudiante - Motivo de ajuste'
        unique_together = ('carreraEstudianteId', 'cursoAjusteId', 'cohortePropuestoId')
        default_permissions = ('add', 'change', 'delete', 'view', 'approve')

    def __str__(self):
        return u"(%s) %s -> %s (%s)" % (
            self.carreraEstudianteId.estudianteId, self.carreraEstudianteId.cohorteId, self.cohortePropuestoId,
            self.motivoAjusteId)


class AjusteAsignatura(models.Model):
    """
Nomenclador del ajuste de una Asignatura.
Ejemplos: (muy largo de explicar)

@cvar ajusteEstudianteId: Representa la relación 1:M con AjusteEstudiante. 
@cvar situacionId:Representa la relación 1:M con Situacion.
@cvar asignaturaCohorteId:Representa la relación 1:M con AsignaturaCohorte. 
@cvar activo: Valor booleano que representa si un Ajuste a una Asignatura está activo o no para ser usado en la aplicación.
"""
    ajusteEstudianteId = models.ForeignKey(AjusteEstudiante, verbose_name="Estudiante")
    asignaturaCohorteId = models.ForeignKey(AsignaturaCohorte, verbose_name='Asignatura')
    situacionId = models.ForeignKey(Situacion, verbose_name='Situación de la asignatura')
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Ajuste de asignatura'
        verbose_name_plural = 'Ajustes de asignaturas'
        unique_together = ('ajusteEstudianteId', 'asignaturaCohorteId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s (%s) %s" % (self.ajusteEstudianteId.carreraEstudianteId, self.situacionId, self.asignaturaCohorteId)


class AjusteAsignaturaConvalidada(models.Model):
    """
Nomenclador de Ajustes a una Asigantura Convalidada.
Ejemplos: (muy largo de explicar) # TODO
@cvar asignaturaVencidaId: Representa la relación 1:M con AsignaturaVencida.
@cvar ajusteAsignaturaId:Representa la relación 1:M con AjusteAsignatura.
@cvar activo: Valor booleano que representa si  el ajuste a una asigantura convalidada está activo o no para ser usado en la aplicación.
"""
    ajusteAsignaturaId = models.ForeignKey(AjusteAsignatura, verbose_name='Qué asignatura convalidó')
    asignaturaVencidaId = models.ForeignKey(AsignaturaVencida, verbose_name='Con cuál')
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Ajuste de asignatura convalidada'
        verbose_name_plural = 'Ajuste de asignaturas convalidadas'
        unique_together = ('ajusteAsignaturaId', 'asignaturaVencidaId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s " % self.asignaturaVencidaId


class AprobacionDeAjuste(models.Model):  # TODO
    """
Nomenclador de Ajustes a una Asigantura Convalidada.
Ejemplos: (muy largo de explicar) # TODO
@cvar asignaturaVencidaId: Representa la relación 1:M con AsignaturaVencida.
@cvar ajusteAsignaturaId:Representa la relación 1:M con AjusteAsignatura.
@cvar activo: Valor booleano que representa si  el ajuste a una asigantura convalidada está activo o no para ser usado en la aplicación.
"""
    trabajadorId = models.ForeignKey(Trabajador, verbose_name='Trabajador')
    carreraEstId = models.ForeignKey(CarreraEstudiante, verbose_name='Estudiante y carrera')
    ajusteEstudianteId = models.ForeignKey(AjusteEstudiante, verbose_name='Propuesta de ajuste', blank=True, null=True)
    estadoId = models.ForeignKey(EstadoAjuste, verbose_name='Estado de proceso')
    fecha = models.DateTimeField(auto_now=True)
    comentarios = models.CharField('Comentarios', max_length=300, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Aprobación de ajuste'
        verbose_name_plural = 'Aprobación de ajustes'
        unique_together = (('trabajadorId', 'carreraEstId', 'estadoId', 'fecha'),
                           ('trabajadorId', 'carreraEstId', 'ajusteEstudianteId', 'estadoId'))
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s %s" % (self.trabajadorId, self.carreraEstId)