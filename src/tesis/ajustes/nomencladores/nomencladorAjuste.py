__author__ = 'Abel'
# -*- coding: utf-8 -*-
from django.db import models


class MotivoAjuste(models.Model):
    """
Nomenclador de motivos de ajuste.
Ejemplos: Baja, Traslado, Licencia
@cvar nombre: Representa el nombre completo del motivo de ajuste.
@cvar activo: Valor booleano que representa si un motivo de ajuste está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Nombre del motivo', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Motivo de ajuste'
        verbose_name_plural = 'Motivos de ajuste'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class DocumentacionAnalizada(models.Model):
    """
Nomenclador de documentación analizada.
Ejemplos: Expediente académico

@cvar nombre: Representa el nombre completo de la documentación analizada.
@cvar activo: Valor booleano que representa si una documentación está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Nombre del documento', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Documentación analizada'
        verbose_name_plural = 'Documentación analizada'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Situacion(models.Model):
    """
Nomenclador de situación de la asignatura.
Ejemplos: Abonada, Aprobada, Eximida.

@cvar nombre: Representa el nombre completo de la situación.
@cvar activo: Valor booleano que representa si una situación está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Nombre de la situación', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Situación de la asignatura'
        verbose_name_plural = 'Situaciones de asignaturas'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class EstadoAjuste(models.Model):  # TODO
    """
Nomenclador de motivos de ajuste.
Ejemplos: Baja, Traslado, Licencia
@cvar nombre: Representa el nombre completo del motivo de ajuste.
@cvar activo: Valor booleano que representa si un motivo de ajuste está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Nombre del estado', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Estado de ajuste'
        verbose_name_plural = 'Estados de ajustes'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre