# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('planEstudio', '0001_initial'),
        ('ajustes', '0001_initial'),
        ('persona', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='aprobaciondeajuste',
            name='carreraEstId',
            field=models.ForeignKey(verbose_name='Estudiante y carrera', to='planEstudio.CarreraEstudiante'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='aprobaciondeajuste',
            name='estadoId',
            field=models.ForeignKey(verbose_name='Estado de proceso', to='ajustes.EstadoAjuste'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='aprobaciondeajuste',
            name='trabajadorId',
            field=models.ForeignKey(verbose_name='Trabajador', to='persona.Trabajador'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='aprobaciondeajuste',
            unique_together=set([('trabajadorId', 'carreraEstId', 'estadoId', 'fecha'), ('trabajadorId', 'carreraEstId', 'ajusteEstudianteId', 'estadoId')]),
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='anhoSemestreAjustadoId',
            field=models.ForeignKey(verbose_name='Año y semestre ajustado', to='planEstudio.AnhoSemestre', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='carreraEstudianteId',
            field=models.ForeignKey(verbose_name='Estudiante', to='planEstudio.CarreraEstudiante'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='cohortePropuestoId',
            field=models.ForeignKey(verbose_name='Cohorte ajustado', to='planEstudio.Cohorte'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='cursoAjusteId',
            field=models.ForeignKey(verbose_name='Curso en que se realiza el ajuste', to='planEstudio.Curso'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='documentacionAnalizadaId',
            field=models.ForeignKey(verbose_name='Documentación analizada', to='ajustes.DocumentacionAnalizada'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteestudiante',
            name='motivoAjusteId',
            field=models.ForeignKey(verbose_name='Motivo de ajuste', to='ajustes.MotivoAjuste'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='ajusteestudiante',
            unique_together=set([('carreraEstudianteId', 'cursoAjusteId', 'cohortePropuestoId')]),
        ),
        migrations.AddField(
            model_name='ajusteasignaturaconvalidada',
            name='ajusteAsignaturaId',
            field=models.ForeignKey(verbose_name='Qué asignatura convalidó', to='ajustes.AjusteAsignatura'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteasignaturaconvalidada',
            name='asignaturaVencidaId',
            field=models.ForeignKey(verbose_name='Con cuál', to='planEstudio.AsignaturaVencida'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='ajusteasignaturaconvalidada',
            unique_together=set([('ajusteAsignaturaId', 'asignaturaVencidaId')]),
        ),
        migrations.AddField(
            model_name='ajusteasignatura',
            name='ajusteEstudianteId',
            field=models.ForeignKey(verbose_name='Estudiante', to='ajustes.AjusteEstudiante'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteasignatura',
            name='asignaturaCohorteId',
            field=models.ForeignKey(verbose_name='Asignatura', to='planEstudio.AsignaturaCohorte'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ajusteasignatura',
            name='situacionId',
            field=models.ForeignKey(verbose_name='Situación de la asignatura', to='ajustes.Situacion'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='ajusteasignatura',
            unique_together=set([('ajusteEstudianteId', 'asignaturaCohorteId')]),
        ),
    ]
