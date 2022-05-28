# -*- coding: utf-8 -*-
from django.db import models
# from planEstudio.models import AsignaturaCohorte, AsignaturaVencida, Cohorte, CarreraEstudiante
from django.core.urlresolvers import reverse
from django.shortcuts import render, render_to_response, get_object_or_404
# from planEstudio.metodos import get_cohortes_planEstudio



class Curso(models.Model):
    """
Nomenclador de cursos.
Ejemplos: 2012-2013, 2014-2015, 2015-2016

@cvar nombre: Representa el nombre completo del curso.
@cvar activo: Valor booleano que representa si un curso está activo o no para smer usado en la aplicación.
"""
    nombre = models.CharField('Curso', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Curso'
        verbose_name_plural = 'Curso'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Anho(models.Model):
    """
Nomenclador de Años.
Ejemplos: 1ro, 2do

@cvar nombre: Representa el nombre completo del año.
@cvar abreviatura: Representa la abreviatura proveniente del nombre del año.
@cvar activo: Valor booleano que representa si un año está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Anho', unique=True, max_length=80)
    abreviatura = models.CharField('Abreviatura', max_length=20)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Anho'
        verbose_name_plural = 'Anhos'
        unique_together = ('nombre', 'abreviatura')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.abreviatura


class Semestre(models.Model):
    """
Nomenclador de Semestres.
Ejemplos: 1er semestre, 2do semestre

@cvar nombre: Representa el nombre completo del semestre.
@cvar abreviatura: Representa referente al nombre del semestre.
@cvar activo: Valor booleano que representa si un semestre está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Semestre', unique=True, max_length=80)
    abreviatura = models.CharField('Abreviatura', max_length=20, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Semestre'
        verbose_name_plural = 'Semestre'
        unique_together = ('nombre', 'abreviatura')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s" % self.nombre


class AnhoSemestre(models.Model):
    """
Nomenclador de años y semestres.
Ejemplos: 1ro / 1er semestre, 5to / 2do semestre

@cvar anhoId: Representa la relación de 1:M con la tabla Anho.
@cvar semestreId:  Representa la relación de 1:M con la tabla Semestre.
@cvar activo: Valor booleano que representa si un año dentro de un semestre está activo o no para ser usado en la aplicación.
"""
    anhoId = models.ForeignKey(Anho, verbose_name='Anho')
    semestreId = models.ForeignKey(Semestre, verbose_name='Semestre')
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Semestre de un anho'
        verbose_name_plural = 'Semestres de un anho'
        unique_together = ('anhoId', 'semestreId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s año / %s semestre" % (self.anhoId, self.semestreId)


class PlanEstudio(models.Model):
    """
Nomenclador de planes de estudio.
Ejemplos: Plan D, Plan C
@cvar nombre: Representa el nombre del plan de estudio.
@cvar cantidadPeriodos: Representa la catntidada de período que puedan integrar el plan de estudio.
@cvar comentario: Representa una nota referente al plan de estudio.
@cvar activo: Valor booleano que representa si una disciplina está activa o no para ser usada en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=50)
    cantidadPeriodos = models.IntegerField('Cantidad de períodos', default=10)
    comentarios = models.TextField('Comentario', max_length=100, blank=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Plan de estudio'
        verbose_name_plural = 'Planes de estudio'
        unique_together = ('nombre', 'cantidadPeriodos')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre

    def get_absolute_url(self):
        return reverse('planEstudio:plan_estudio_detalle', kwargs={'pk': self.pk})
        #
        # def cohortes(self):
        # from planEstudio.models import Cohorte
        #
        # object_list = Cohorte.objects.filter(planEstudioId=self.pk, activo=True)
        # return object_list
