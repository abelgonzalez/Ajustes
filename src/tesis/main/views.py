# encoding=utf-8
# -*- coding: utf-8 -*-
# encoding: utf-8
from tesis.metodos import visibilidad_tiles
from ajustes.models import AjusteEstudiante, AjusteAsignatura, AjusteAsignaturaConvalidada, AprobacionDeAjuste
from planEstudio.metodos import obtener_asignatura_optativa_electiva, obtener_asignatura_cohorte, \
    obtener_asignatura_vencida_cohorte, obtener_todas_universidades_, obtener_asignaturas_cohorte
from planEstudio.models import CarreraEstudiante, AsignaturaVencida, AsignaturaCohorte
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login, authenticate, logout
from django import forms
from main.forms import UserForm  # , PerfilForm
from django.contrib.auth.models import User
from django.shortcuts import render, redirect, render_to_response
from django.core.mail import EmailMessage
from django.http import HttpResponseRedirect
from django.template import RequestContext
from django.utils import timezone
from main.forms import ContactoForm
from django.contrib.auth.models import User
# from Sistema.models import Person, Categoria ESTE LO TRABAJAS CON User a partir de ahora
from django.contrib import auth, admin
from persona.models import Estudiante, Trabajador
from django.shortcuts import render, get_object_or_404, get_list_or_404
from django.contrib.admin.models import LogEntry
from django.core.urlresolvers import reverse_lazy, reverse


def my_view404(request):
    my_object = get_object_or_404(Estudiante, pk=1)


def my_view(request):
    my_objects = get_list_or_404(Estudiante, activo=True)


#
#
# def autenticar(request):
# if request.method == 'POST':
# username = request.POST['username']
# password = request.POST['password']
# user = authenticate(username=username, password=password)
# if user is not None:
# if user.is_active:
# login(request, user)
# return HttpResponseRedirect(reverse('inicio'))
# else:
# return render(request, 'autenticar.html', {'error': True})
# else:
# return render(request, 'autenticar.html', {'error': True})
# else:
# return render(request, 'autenticar.html')
#

def autenticar(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                visibilidad_tiles(request)
                return HttpResponseRedirect(reverse('inicio'))
            else:
                return render(request, 'autenticar.html', {'error': True})
        else:
            return render(request, 'autenticar.html', {'error': True})
    else:
        if request.user.is_authenticated():
            visibilidad_tiles(request)  # refrescar los tiles
            return HttpResponseRedirect(reverse('inicio'))
        else:
            return render(request, 'autenticar.html')


def inicio(request):
    visibilidad_tiles(request)  # refrescar los tiles
    try:
        registro = get_list_or_404(LogEntry, user_id=request.user)[:5]
    except:
        registro = ''
    args = {'registro': registro}
    return render(request, 'inicio.html', args)


@login_required()
def cerrar_sesion(request):
    try:
        del request.session['secretaria']
        del request.session['coordinador']
        del request.session['decano']
    except KeyError:
        pass
    auth.logout(request)
    return HttpResponseRedirect(reverse('autenticar'))


def acerca(request):
    return render(request, 'acerca.html')


def tiempo(request):
    return render(request, 'tiempo.html')


def my_custom_page_not_found_view(request):
    return render(request, '404.html')


def my_custom_error_view(request):
    return render(request, '500.html')


def my_custom_permission_denied_view(request):
    return render(request, '403.html')


def my_custom_bad_request_view(request):
    return render(request, '400.html')


def contacto(request):
    if request.method == 'POST':
        formulario = ContactoForm(request.POST)
        if formulario.is_valid():
            titulo = 'Mensaje desde Ajustes-UMCC'
            contenido = formulario.cleaned_data['mensaje'] + "\n"
            contenido += 'Comunicarse a: ' + formulario.cleaned_data['correo']
            correo = EmailMessage(titulo, contenido, to=['abel.gonzalez@infonet.umcc.cu'])
            correo.send()
            return HttpResponseRedirect('/')
    else:
        formulario = ContactoForm()
    return render_to_response('contacto.html', {'formulario': formulario}, context_instance=RequestContext(request))


@login_required()
def perfil(request, usuario):
    datetime = timezone.now()
    registro = LogEntry.objects.filter(user_id=request.user)[:10]  # get_list_or_404(LogEntry, user_id=usuario)[:10]
    args = {'datetime': datetime, 'registro': registro}
    return render(request, 'perfil.html', args)


def imprimir_ajusteId(request, ajusteEstudianteId):
    ajusteEstudiante = get_object_or_404(AjusteEstudiante, pk=ajusteEstudianteId)
    estudiante = ajusteEstudiante.carreraEstudianteId.estudianteId
    cohorteId = ajusteEstudiante.cohortePropuestoId_id
    ajusteAsig = obtener_asignatura_cohorte(cohorteId)
    listAsigCohorte = []
    for a in ajusteAsig:
        listAsigCohorte.append(a)
    lista_cp = listAsigCohorte
    asig_opt_elec2 = obtener_asignatura_optativa_electiva()
    cohorteprev = ajusteEstudiante.cohortePropuestoId
    cohorteact = ajusteEstudiante.carreraEstudianteId.cohorteId
    # ordenar por anho semestre primero.....
    vaa = ajusteEstudiante.carreraEstudianteId.cohorteId
    asigVencidas = obtener_asignatura_vencida_cohorte(vaa)
    listAsigVencidas = []
    for a in asigVencidas:
        listAsigVencidas.append(a)
    lista_ca = listAsigVencidas
    asig_opt_elec1 = obtener_asignatura_optativa_electiva()
    listaAsigAjustadas = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True)
    ajustadas = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True)
    listaAsigConvalidadas = []
    ajusteAsigna = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, situacionId_id=3,
                                                   activo=True)
    for a in ajusteAsigna:  # este método puede ser la solucion para el multiple...
        conva = AjusteAsignaturaConvalidada.objects.filter(ajusteAsignaturaId=a)
        for b in conva:
            listaAsigConvalidadas.append(b)
    listaAsigConvalidadas = listaAsigConvalidadas  # AjusteAsignaturaConvalidada.objects.filter(activo=True)
    vencida_marca = AsignaturaVencida.objects.filter(carreraEstudianteId=ajusteEstudiante.carreraEstudianteId,
                                                     activo=True)
    list_vencidas_marca = []
    for a in vencida_marca:
        list_vencidas_marca.append(a)

    list_vencidas_marca = list_vencidas_marca
    impreso_por = get_object_or_404(Trabajador, userId=request.user.pk)

    args = {'ajusteEstudiante': ajusteEstudiante, 'estudiante': estudiante, 'lista_cp': lista_cp,
            'asig_opt_elec2': asig_opt_elec2, 'cohorteprev': cohorteprev, 'cohorteact': cohorteact,
            'lista_ca': lista_ca, 'asig_opt_elec1': asig_opt_elec1, 'listaAsigAjustadas': listaAsigAjustadas,
            'ajustadas': ajustadas, 'listaAsigConvalidadas': listaAsigConvalidadas,
            'list_vencidas_marca': list_vencidas_marca, 'impreso_por': impreso_por}

    return render(request, 'imprimir_ajuste.html', args)


def imprimir_expediente(request):
    return render(request, 'imprimir_expediente.html')


def imprimir_expedienteId(request, expedienteId):
    return render(request, 'imprimir_expediente.html')


def imprimir_ajuste(request):
    return render(request, 'imprimir_ajuste.html')

