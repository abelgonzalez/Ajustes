__author__ = 'Abel'
from django import forms
from persona.models import Estudiante
from planEstudio.models import CarreraEstudiante, Cohorte
from django.forms.models import inlineformset_factory


class EstudianteForm(forms.ModelForm):
    class Meta:
        model = Estudiante
        exclude = ('activo',)
        # help_texts = {
        # 'nombre': 'Some useful help text.',
        # }
        widgets = {
            # 'nombre': forms.TextInput(attrs={'id': 'nombre', 'required': 'true'}),
            # # 'class': '{required:true, minlength:2, maxlength:100}'}
            'carneIdentidad': forms.NumberInput(attrs={'id': 'carneIdentidad', 'minlength': '1', 'required': 'true'}),
            # 'comentarios': forms.Textarea(attrs={'id': 'comentarios', 'required': 'true', 'maxlength': '3'}),
            # 'activo': forms.CheckboxInput(attrs={'id': 'activo'})
        }


class CarreraEstudianteForm(forms.ModelForm):
    class Meta:
        model = CarreraEstudiante
        exclude = ('estudianteId', 'activo',)  # cuidado, quizás no te deje ver el est a la hora de manipular esto

    def __init__(self, *args, **kwargs):  # acá se pueden hacer buenas validaciones
        super(CarreraEstudianteForm, self).__init__(*args, **kwargs)
        self.fields['estudianteId'].queryset = Estudiante.objects.filter(activo=True)
        self.fields['cohorteId'].queryset = Cohorte.objects.filter(activo=True)