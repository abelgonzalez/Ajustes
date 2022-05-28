__author__ = 'Abel'
# -*- coding: utf-8 -*-
# encoding: utf-8
from django import forms
#from apps.atencion_socio.models import PersonaNatural
from django.contrib.auth.models import User


class ContactoForm(forms.Form):
    correo = forms.EmailField(label='Tu correo electrónico')
    mensaje = forms.CharField(widget=forms.Textarea)


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')


