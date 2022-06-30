__author__ = 'Abel'
# -*- coding: utf-8 -*-
from django.db import models


class Universidad(models.Model):
    """
Nomenclador de países. 
Ejemplos: Universidad de Matanzas, Universidad de las Ciencias Informáticas, Instituto Superior José Antonio Echeverría

@cvar nombre: Representa el nombre completo de la universidad.
@cvar siglas: Representa las siglas de la universidad.
@cvar activo: Valor booleano que representa si una universidad está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Universidad', unique=True, max_length=80)
    siglas = models.CharField('Siglas', max_length=10)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Universidad'
        verbose_name_plural = 'Universidades'
        unique_together = ('nombre', 'siglas')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.siglas


class Facultad(models.Model):
    """
Nomenclador de facultades.
Ejemplos:  Facultad de Ciencias Económicas e Informática, Facultad de Ciencias Sociales y Humanidades, Facultad 2
@cvar nombre: Representa el nombre completo de la facultad.
@cvar siglas: Representa las siglas de la facultad.
@cvar universidad: Representa la relación 1:M con Universidad.
@cvar activo: Valor booleano que representa si una facultad está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Facultad', unique=True, max_length=80)
    siglas = models.CharField('Siglas', max_length=10)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Facultad'
        verbose_name_plural = 'Facultades'
        unique_together = ('nombre', 'siglas')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Carrera(models.Model):
    """
Nomenclador de municipios.
Ejemplos:  Colón, Teixeira, Caracas
@cvar nombre: Representa el nombre completo de la carrera.
@cvar facultad: Representa la relación 1:M con Facultad.
@cvar activo: Valor booleano que representa si una carrera está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Carrera', unique=True, max_length=80)
    siglas = models.CharField('Siglas', max_length=10, null=True, blank=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'
        unique_together = ('nombre', 'siglas')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class TipoDeCurso(models.Model):
    """
Nomenclador de tipos de cursos.
Ejemplos: Curso regular diurno, Curso por encuentros

@cvar nombre: Representa el nombre completo del tipo de curso.
@cvar siglas: Representa las siglas del tipo de curso.
@cvar activo: Valor booleano que representa si un tipo de curso está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Tipo de curso', unique=True, max_length=80)
    siglas = models.CharField('Siglas', max_length=10)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Tipo de curso'
        verbose_name_plural = 'Tipos de cursos'
        unique_together = ('nombre', 'siglas')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s (%s)" % (self.nombre, self.siglas)


class CarreraTipoDeCurso(models.Model):
    """
Nomenclador de carreras y los tipos de cursos asociados a ella.
Ejemplos: Ingeniería Informática - CRD, Ingeniería Informática - CRE

@cvar carreraId: Representa la relación 1:M con Carrera.
@cvar tipoCursoId: Representa la relación 1:M con TipoDeCurso.
@cvar activo: Valor booleano que representa si una Carrera tipo curso está activo o no para ser usado en la aplicación.
"""
    universidadId = models.ForeignKey(Universidad, verbose_name='Universidad')
    facultadId = models.ForeignKey(Facultad, verbose_name='Facultad')
    carreraId = models.ForeignKey(Carrera, verbose_name='Carrera')
    tipoCursoId = models.ForeignKey(TipoDeCurso, verbose_name='Tipo de curso')
    cantidadAnhos = models.IntegerField('Cantidad de años', default=5)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Tipo de curso en carrera'
        verbose_name_plural = 'Tipos de cursos en Carreras'
        unique_together = ('universidadId', 'facultadId', 'carreraId', 'tipoCursoId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s (%s) %s %s " % (self.carreraId, self.facultadId, self.universidadId, self.tipoCursoId, )