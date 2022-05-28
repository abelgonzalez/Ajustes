__author__ = 'Abel'

from django import forms
from planEstudio.nomencladores.nomencladorPlanEstudio import PlanEstudio
from planEstudio.models import Cohorte, AsignaturaCohorte, AsignaturaOptativaElectiva
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre, Curso
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso
from django.forms import widgets
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import Asignatura, TipoAsignatura, Disciplina, Curriculo, \
    TipoEvaluacion


class PlanEstudioForm(forms.ModelForm):
    class Meta:
        model = PlanEstudio
        exclude = ('activo',)
        help_texts = {
            'nombre': 'Some useful help text.',
        }
        widgets = {
            'nombre': forms.TextInput(attrs={'id': 'nombre', 'required': 'true'}),
            # 'class': '{required:true, minlength:2, maxlength:100}'}
            'cantidadPeriodos': forms.NumberInput(
                attrs={'id': 'cantidadPeriodos', 'minlength': '1', 'maxlength': '20'}),
            'comentarios': forms.Textarea(attrs={'id': 'comentarios', 'maxlength': '3'})
            # 'activo': forms.CheckboxInput(attrs={'id': 'activo'})
        }

        # def clean_mensaje(self):
        # mensaje = self.cleaned_data.get('mensaje', '')
        # num_words = len(mensaje.split())
        # if num_words < 4:
        # raise forms.ValidationError("No suficientes palabras")
        # if mensaje == 'Sus comentarios...':
        # raise forms.ValidationError("Introduzca sus comentarios...")
        # return mensaje


class CohorteForm(forms.ModelForm):
    # carreraTipoCursoId = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
    class Meta:
        # serving_size = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
        model = Cohorte
        exclude = ('activo',)

    def __init__(self, current_user, **kwargs):
        super(CohorteForm, self).__init__(**kwargs)
        az = current_user
        init_data = kwargs['initial']
        planId = init_data['planId']
        self.current_user = current_user
        self.initial['planEstudioId'] = planId
        # fields = ('carreraTipoCursoId', 'planEstudioId', 'cursoId')

        # fields = ('carreraTipoCursoId', 'planEstudioId', 'cursoId')
        # widgets = {
        # 'carreraTipoCursoId': forms.ModelChoiceField(queryset=CarreraTipoDeCurso.objects.all(), to_field_name='carreraTipoCursoId'),
        # 'planEstudioId': forms.ModelChoiceField(queryset=PlanEstudio.objects.all(), to_field_name='planEstudioId'),
        # 'cursoId': forms.ModelChoiceField(queryset=Curso.objects.all(), to_field_name='cursoId')


class CohorteUpdateForm(forms.ModelForm):
    # carreraTipoCursoId = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
    class Meta:
        # serving_size = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
        model = Cohorte
        exclude = ('activo',)

    def __init__(self, current_user, **kwargs):
        super(CohorteUpdateForm, self).__init__(**kwargs)
        az = current_user
        init_data = kwargs['initial']
        cohorte = init_data['cohorteId']
        self.current_user = current_user
        self.initial['cohorteId'] = cohorte


class CohorteDuplicarForm(forms.ModelForm):
    # carreraTipoCursoId = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
    class Meta:
        # serving_size = forms.ChoiceField(choices=CarreraTipoDeCurso.objects.all(), widget=forms.Select())
        model = Cohorte
        exclude = ('activo',)
        # fields = ('carreraTipoCursoId', 'planEstudioId', 'cursoId')

        # fields = ('carreraTipoCursoId', 'planEstudioId', 'cursoId')
        # widgets = {
        # 'carreraTipoCursoId': forms.ModelChoiceField(queryset=CarreraTipoDeCurso.objects.all(), to_field_name='carreraTipoCursoId'),
        # 'planEstudioId': forms.ModelChoiceField(queryset=PlanEstudio.objects.all(), to_field_name='planEstudioId'),
        # 'cursoId': forms.ModelChoiceField(queryset=Curso.objects.all(), to_field_name='cursoId')


class AsignaturaCohorteForm(forms.ModelForm):
    class Meta:
        model = AsignaturaCohorte
        exclude = ('activo',)
        # fields = ('asignaturaId', 'cohorteId')

    def __init__(self, **kwargs):
        super(AsignaturaCohorteForm, self).__init__(**kwargs)
        self.initial['asignaturaCohorteId'] = AsignaturaCohorte.objects.filter(activo=True)
        self.initial['cohorteId'] = Cohorte.objects.filter(activo=True)
        self.initial['anhoSemestreId'] = AnhoSemestre.objects.filter(activo=True)
        self.initial['tipoAsignaturaId'] = TipoAsignatura.objects.filter(activo=True)
        self.initial['disciplinaId'] = Disciplina.objects.filter(activo=True)
        self.initial['curriculoId'] = Curriculo.objects.filter(activo=True)
        self.initial['tipoEvauacionId'] = TipoEvaluacion.objects.filter(activo=True)


class AsignaturaCohorteUpdateForm(forms.ModelForm):
    class Meta:
        model = AsignaturaCohorte
        exclude = ('cohorteId', 'activo')


class AsignaturaOptativaElectivaForm(forms.ModelForm):
    class Meta:
        model = AsignaturaOptativaElectiva
        exclude = ('activo',)

    def __init__(self, current_user, **kwargs):
        super(AsignaturaOptativaElectivaForm, self).__init__(**kwargs)
        az = current_user
        init_data = kwargs['initial']
        asigCoho = init_data['asignaturacohorteId']
        self.current_user = current_user
        self.initial['asignaturaCohorteId'] = asigCoho
        # self.fields['asignaturaCohorteId'].queryset = AsignaturaCohorte.objects.filter(asignaturaId=asigCoho,
        # activo=True)
        # self.initial['asignaturaCohorteId'] = AsignaturaCohorte.objects.filter(asignaturaId=asigCoho,
        # activo=True)
        # self.fields['asignaturaCohorteId'].initial = AsignaturaCohorte.objects.filter(asignaturaId=asigCoho,
        # activo=True)


class AsignaturaOptativaElectivaUpdateForm(forms.ModelForm):
    class Meta:
        model = AsignaturaOptativaElectiva
        exclude = ('activo',)



    def __init__(self, current_user, **kwargs):
        super(AsignaturaOptativaElectivaUpdateForm, self).__init__(**kwargs)
        az = current_user
        init_data = kwargs['instance']
        asigCoho = init_data.asignaturaCohorteId
        self.current_user = current_user
        self.initial['asignaturaCohorteId'] = asigCoho