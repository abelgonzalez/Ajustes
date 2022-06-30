__author__ = 'Abel'
# -*- coding: utf-8 -*-
from django.db import models


class Asignatura(models.Model):
    """
Nomenclador de asignaturas.
Ejemplos: Matemática I, Programación Orientada a Objetos, Seminario Profesional
@cvar codigo: Representa el codigo de la asignatura.
@cvar nombre: Representa el nombre de la asignatura.
@cvar abreviatura: Representa la abreviatura que va a tomar una asignatura.
@cvar activo: Valor booleano que representa si la asignatura esta activa o no para ser usad en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=100)
    abreviatura = models.CharField('Abreviatura', max_length=10, blank=True, null=True)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Asignatura'
        verbose_name_plural = 'Asignaturas'
        unique_together = ('nombre', 'abreviatura')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class TipoAsignatura(models.Model):
    """
Nomenclador de tipos de asignaturas.
Ejemplos: Ordinaria, Electiva, Optativa
@cvar nombre: Representa el nombre completo del tipo de asignatura.
@cvar activo: Valor booleano que representa si un tipo de asignatura está activa o no para ser usada en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Tipo de asignatura'
        verbose_name_plural = 'Tipos de asignaturas'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Disciplina(models.Model):
    """
Nomenclador de disciplinas.
Ejemplos: Aplicaciones computacionales, Programación, Ingeniería de Software
@cvar nombre: Representa el nombre completo de la disciplina.
@cvar activo: Valor booleano que representa si una disciplina está activa o no para ser usada en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Disciplina'
        verbose_name_plural = 'Disciplinas'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Curriculo(models.Model):
    """
Nomenclador de currículos.
Ejemplos:  Base, Propio, Optativo/Electivo
@cvar nombre: Representa el nombre del currículo.
@cvar activo: Valor booleano que representa si una disciplina está activa o no para ser usada en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Currículo'
        verbose_name_plural = 'Currículos'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class TipoEvaluacion(models.Model):
    """
Nomenclador de tipos de evaluación.
Ejemplos: Examen final, Proyecto de curso
@cvar nombre: Representa el tipo de evaluación.
@cvar activo: Valor booleano que representa si una disciplina está activa o no para ser usada en la aplicación.
"""
    nombre = models.CharField('Nombre', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Tipo de evaluación'
        verbose_name_plural = 'Tipos de evaluaciones'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


