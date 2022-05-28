__author__ = 'Abel'
# -*- coding: utf-8 -*-
from django.db import models


class Departamento(models.Model):
    """
Nomenclador de Departamento.
Ejemplos: Informática, Informatización, Tecnología Educativa

@cvar nombre: Representa el nombre completo del departamento.
@cvar activo: Valor booleano que representa si un departamento está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Departamento', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Departamento'
        verbose_name_plural = 'Departamentos'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class CategoriaDocente(models.Model):
    """
Nomenclador de Categorias Docentes.
Ejemplos: Profesor titular, Profesor auxiliar.

@cvar nombre: Representa el nombre completo de una Categoria Docente.
@cvar activo: Valor booleano que representa si una Categoria Docente está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Categoría docente', unique=True, max_length=50)
    activo = models.BooleanField('Activo', default=True)


    class Meta:
        verbose_name = 'Categoría docente'
        verbose_name_plural = 'Categorías docentes'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre