from django.shortcuts import render, render_to_response, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views import generic
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView
from django.views.generic.detail import DetailView, SingleObjectMixin
from django.core.urlresolvers import reverse, reverse_lazy
from django.contrib.auth.decorators import login_required, permission_required
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator
from tesis.metodos import get_query
from django.contrib.formtools.wizard.views import SessionWizardView
from django.template.response import TemplateResponse
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.http import HttpResponse
import json
from tesis.metodos import log_nuevo1, log_editar1, log_eliminar1

# modelos
from ajustes.models import AjusteEstudiante
from persona.models import Estudiante, Trabajador
from planEstudio.forms import CohorteForm
from planEstudio.models import Cohorte, CarreraEstudiante
# formularios
from persona.forms import EstudianteForm

from planEstudio.metodos import obtener_asignatura_optativa_electiva, obtener_asignatura_cohorte, \
    obtener_asignatura_vencida_cohorte, obtener_todas_universidades_, obtener_asignaturas_cohorte
from ajustes.models import AjusteEstudiante, AprobacionDeAjuste, AjusteAsignatura, AjusteAsignaturaConvalidada


@login_required()
@permission_required('ajustes.add_ajusteEstudiante')
def datos_estudiante_ajuste(request, carreraEstudianteId, motivoAjusteId, documentacionAnalizadaId, cursoAjusteId):
    estudiante = get_object_or_404(AjusteEstudiante, carreraEstudianteId=carreraEstudianteId,
                                   motivoAjusteId=motivoAjusteId, documentacionAnalizadaId=documentacionAnalizadaId,
                                   cursoAjusteId=cursoAjusteId)
    args = {'object': estudiante}
    return render(request, '_datos_ajuste_estudiante.html', args)


@login_required()
@permission_required('ajustes.add_ajusteEstudiante')
def resultados_ajusteAJAX(request):
    ajusteEstudiante = AjusteEstudiante.objects.filter(activo=True).first()  # lo tengo de querystring
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
    listaAsigConvalidadas = AjusteAsignaturaConvalidada.objects.filter(activo=True)
    progreso = AprobacionDeAjuste.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True).last()
    args = {'estudiante': estudiante, 'lista_cp': lista_cp, 'asig_opt_elec2': asig_opt_elec2,
            'cohorteprev': cohorteprev, 'cohorteact': cohorteact, 'lista_ca': lista_ca,
            'asig_opt_elec1': asig_opt_elec1, 'listaAsigAjustadas': listaAsigAjustadas,
            'listaAsigConvalidadas': listaAsigConvalidadas}

    return render(request, 'cohorte_select_ajuste.html', args)


@login_required()
@permission_required('ajustes.add_ajusteEstudiante')
def ajuste_ajusteestudianteAJAX(request):
    id_carreraEstudiante = request.GET['id_carreraEstudiante']
    id_motivoAjuste = request.GET['id_motivoAjuste']
    id_documentacionAnalizada = request.GET['id_documentacionAnalizada']
    id_cursoAjuste = request.GET['id_cursoAjuste']
    id_cohorteprev = request.GET['id_cohorteprev']

    list_id_lista_cp = request.GET['list_id_lista_cp[]']
    list_id_asig_opt_elec2 = request.GET['list_id_asig_opt_elec2[]']
    id_cohorteact = request.GET['id_cohorteact']
    list_id_lista_ca = request.GET['list_id_lista_ca[]']
    list_id_asig_opt_elec1 = request.GET['list_id_asig_opt_elec1[]']
    list_id_listaAsigAjustadas = request.GET['list_id_listaAsigAjustadas[]']
    list_id_listaAsigConvalidadas = request.GET['list_id_listaAsigAjustadas[]']

    diccionario = {}

    carreraestudiante = CarreraEstudiante.objects.filter(pk=id_carreraEstudiante).first()

    estudiante = carreraestudiante.estudianteId
    diccionario['estudiante'] = estudiante

    cohorteId = id_cohorteprev
    ajusteAsig = obtener_asignatura_cohorte(cohorteId)
    listAsigCohorte = []
    for a in ajusteAsig:
        listAsigCohorte.append(a)
    diccionario['lista_cp'] = listAsigCohorte

    diccionario['asig_opt_elec2'] = obtener_asignatura_optativa_electiva()

    cohoPropuesto = get_object_or_404(Cohorte, pk=id_cohorteprev)
    diccionario['cohorteprev'] = cohoPropuesto

    diccionario['cohorteact'] = carreraestudiante.cohorteId

    vaa = carreraestudiante.cohorteId
    asigVencidas = obtener_asignatura_vencida_cohorte(vaa)
    listAsigVencidas = []
    for a in asigVencidas:
        listAsigVencidas.append(a)
    diccionario['lista_ca'] = listAsigVencidas

    diccionario['asig_opt_elec1'] = obtener_asignatura_optativa_electiva()

    # acá es cuando se empieza a trabajar con lo que se envía x GET


    listaAsigAjustadas = []
    for a in list_id_listaAsigAjustadas:
        ajasig = AjusteAsignatura(ajusteEstudianteId_id=1, asignaturaCohorteId_id=1,
                                  situacionId_id=2)  # el ajusteEstudiante id puede ser así, eso solo para probar
        listAsigVencidas.append(a)

    diccionario['listaAsigAjustadas'] = listaAsigAjustadas

    bla = True

    return True


@login_required()
@permission_required('ajustes.add_ajusteEstudiante')
def ajuste_ajusteestudiante(data_ajuste):
    return True


@login_required()
def aprobacion_ajuste_proceso(request, pk, accion):
    aa = get_object_or_404(AprobacionDeAjuste, pk=pk)
    trabajad = get_object_or_404(Trabajador, pk=request.user.pk)
    if not aa.ajusteEstudianteId == '':  # es un expediente
        # el 1 se omite pues se hace al salvar el expediente
        if accion == '2':  # enviado a coordinador
            aa.trabajadorId = trabajad
            aa.estadoId_id = 2
            aa.save()
            log_editar1(aa, request)
        elif accion == '3':  # aprobado x el coordinador
            aa.trabajadorId = trabajad
            aa.estadoId_id = 3
            aa.save()
            log_editar1(aa, request)
        elif accion == '4':  # devuelto x el coordinador
            aa.trabajadorId = trabajad
            aa.estadoId_id = 4
            aa.save()
            log_editar1(aa, request)
        # el 5 se omite pues se hace al crear un ajuste nuevo
        elif accion == '6':  # enviada a la secretaria la propuesta de ajuste del coordinador
            aa.trabajadorId = trabajad
            aa.estadoId_id = 6
            aa.save()
            log_editar1(aa, request)
        elif accion == '7':  # enviada al decano la propuesta de ajuste del coordinador
            aa.trabajadorId = trabajad
            aa.estadoId_id = 7
            aa.save()
            log_editar1(aa, request)
        elif accion == '8':  # aprobado por el decano la propuesta de ajuste del coordinador enviada x la secretaria
            aa.trabajadorId = trabajad
            aa.estadoId_id = 8
            aa.save()
            log_editar1(aa, request)
        elif accion == '9':  # devuelto por el decano la propuesta de ajuste del coordinador enviada x la secretaria
            aa.trabajadorId = trabajad
            aa.estadoId_id = 9
            aa.save()
            log_editar1(aa, request)
        elif accion == '10':  # enviado al coordinador devolución del decano
            aa.trabajadorId = trabajad
            aa.estadoId_id = 10
            aa.save()
            log_editar1(aa, request)
        elif accion == '11':  # entregado ajuste a plan al estudiante
            aa.trabajadorId = trabajad
            aa.estadoId_id = 11
            aa.save()
            log_editar1(aa, request)

    return HttpResponseRedirect(reverse('inicio'))
