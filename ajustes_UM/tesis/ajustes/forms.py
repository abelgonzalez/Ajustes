__author__ = 'Abel'
from django import forms
from planEstudio.nomencladores.nomencladorPlanEstudio import PlanEstudio
from ajustes.models import AjusteEstudiante
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso
from django.forms import widgets
from persona.models import Estudiante
from planEstudio.models import Cohorte, CarreraEstudiante
from ajustes.nomencladores.nomencladorAjuste import MotivoAjuste, DocumentacionAnalizada
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre, Curso

class AjusteEstudianteForm(forms.ModelForm):
    class Meta:
        model = AjusteEstudiante
        # fields = ('carreraEstudianteId', 'motivoAjusteId', 'cursoAjusteId', 'anhoSemestreAjustadoId')
        exclude = ('anhoSemestreAjustadoId', 'cohortePropuestoId', 'activo',)
        # exclude = ('activo',)

    def __init__(self, *args, **kwargs):  # acá se pueden hacer buenas validaciones
        super(AjusteEstudianteForm, self).__init__(*args, **kwargs)
        self.fields['carreraEstudianteId'].queryset = CarreraEstudiante.objects.filter(activo=True)
        self.fields['motivoAjusteId'].queryset = MotivoAjuste.objects.filter(activo=True)
        self.fields['documentacionAnalizadaId'].queryset = DocumentacionAnalizada.objects.filter(activo=True)
        self.fields['cursoAjusteId'].queryset = Curso.objects.filter(activo=True)
        # self.fields['cohortePropuestoId'].queryset = Cohorte.objects.filter(activo=True)
        #self.fields['anhoSemestreAjustadoId'].queryset = AnhoSemestre.objects.filter(activo=True)