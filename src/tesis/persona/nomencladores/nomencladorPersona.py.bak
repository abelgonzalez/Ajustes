__author__ = 'Abel'
# -*- coding: utf-8 -*-
from django.db import models


class Pais(models.Model):
    """
Nomenclador de países.
Ejemplos: Cuba, Brasil, Venezuela

@cvar pais: Representa el nombre completo del país.
@cvar activo: Valor booleano que representa si un País está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('País', max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'País'
        verbose_name_plural = 'Países'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Provincia(models.Model):
    """
Nomenclador de provincias.
Ejemplos:  Matanzas, Paraíba, Distrito Capital

@cvar provincia: Representa el nombre completo de la provincia.
@cvar pais: Representa la relación 1:M con País.
@cvar activo: Valor booleano que representa si una Provincia está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Provincia', max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Municipio(models.Model):
    """
Nomenclador de municipios.
Ejemplos:  Colón, Teixeira, Caracas

@cvar provincia: Representa el nombre completo de la provincia.
@cvar pais: Representa la relación 1:M con Provincia.
@cvar activo: Valor booleano que representa si un Municipio está activo o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Municipio', max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Municipio'
        verbose_name_plural = 'Municipios'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Ubicacion(models.Model):
    """
Nomenclador de municipios.
Ejemplos:  Colón, Teixeira, Caracas

@cvar provincia: Representa el nombre completo de la provincia.
@cvar pais: Representa la relación 1:M con Provincia.
@cvar activo: Valor booleano que representa si un Municipio está activo o no para ser usado en la aplicación.
"""
    # TODO
    paisId = models.ForeignKey(Pais, verbose_name='País')
    provinciaId = models.ForeignKey(Provincia, verbose_name='Provincia')
    municipioId = models.ForeignKey(Municipio, verbose_name='Municipio')
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Ubicación'
        verbose_name_plural = 'Ubicaciones'
        unique_together = ('paisId', 'provinciaId', 'municipioId')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s, %s, %s" % (self.municipioId, self.provinciaId, self.paisId)


class Nacionalidad(models.Model):
    """
Nomenclador de nacionalidades.
Ejemplos: Cubana, Brasileña, Venezolana

@cvar nombre: Representa el nombre completo de la nacionalidad.
@cvar activo: Valor booleano que representa si una Nacionalidad está activa o no para ser usado en la aplicación.
"""
    nombre = models.CharField('Nacionalidad', max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Nacionalidad'
        verbose_name_plural = 'Nacionalidades'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Sexo(models.Model):
    """
Nomenclador de sexos.
Ejemplos: Masculino, Femenino, Otro.

@cvar nombre: Representa el nombre del sexo.
@cvar activo: Valor booleano que representa si un sexo está activo para ser usado en la aplicación.
"""
    nombre = models.CharField('Sexo', max_length=50)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Sexo'
        verbose_name_plural = 'Sexos'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class Etnia(models.Model):
    """
Nomenclador de etnias.
Ejemplos: Blanco, Negro, Mestizo.

@cvar nombre: Representa el nombre de la etnia.
@cvar activo: Valor booleano que representa si una etnia está activa para ser usado en la aplicación.
"""
    nombre = models.CharField('Etnia', unique=True, max_length=80)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Etnia'
        verbose_name_plural = 'Etnias'
        unique_together = ('nombre', 'activo')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return self.nombre


class GradoCientifico(models.Model):
    """
Nomenclador de grados científicos.
Ejemplos:  Estudiante, Ingeniero, Máster en Ciencias.

@cvar gradoCientifico: Representa el nombre completo del grado científico.
@cvar abreviatura: Representa la abreviatura del grado científico.
@cvar activo: Valor booleano que representa si un ScientificGrade está activo o no para ser usado en el sistema
"""
    gradoCientifico = models.CharField('Grado científico', unique=True, max_length=80)
    abreviatura = models.CharField('Abreviatura', max_length=5)
    activo = models.BooleanField('Activo', default=True)

    class Meta:
        verbose_name = 'Grado científico'
        verbose_name_plural = 'Grados científicos'
        unique_together = ('gradoCientifico', 'abreviatura')
        default_permissions = ('add', 'change', 'delete', 'view')

    def __str__(self):
        return u"%s (%s)" % (self.gradoCientifico, self.abreviatura)