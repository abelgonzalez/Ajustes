import watson
from django.contrib.auth.models import User
from tesis.metodos import group_required
# from braces.views import GroupRequiredMixin
from django.contrib.admin import models
from django.contrib.contenttypes.models import ContentType
from django.utils.translation import ugettext as _
from django.utils.text import get_text_list
from tesis.metodos import normalize_query
from django.shortcuts import render, render_to_response, get_object_or_404
from django.views.generic.edit import FormView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseRedirect, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.views import generic
from tesis.metodos import get_query
from planEstudio.nomencladores.nomencladorPlanEstudio import Anho, Semestre, AnhoSemestre

from django.db import models
from django.http import JsonResponse

# from django_xhtml2pdf.utils import generate_pdf

# pisa's imports

from io import StringIO
import string, sys
import cgi
from django.template import RequestContext
from django.forms.formsets import formset_factory
from django.http import HttpResponseForbidden, Http404
from django.template.loader import render_to_string
from django.http import HttpResponse
# from six import with_metaclass


# modelos
from planEstudio.models import PlanEstudio, Cohorte, AsignaturaCohorte
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso, Carrera, TipoDeCurso, Universidad, Facultad
from planEstudio.nomencladores.nomencladorPlanEstudio import Curso
# formularios
# metodos
from planEstudio.metodos import obtener_todas_universidades_, obtener_facultad, obtener_carrera, obtener_tipo_curso, \
    obtener_plan_estudio, obtener_curso, obtener_cohorte, cantidad_anhos_carrera, obtener_asignaturas_cohorte, \
    obtener_todos_anhos, obtener_anho_semestre, obtener_anho, obtener_semestre, obtener_todo_anho_semestre, \
    obtener_asignaturas, obtener_selec_anho_semestre, obtener_carrera_tipo_curso, anhos_carrera_tipo_curso, \
    obtener_asignatura_cohorte, obtener_universidad, obtener_asignatura_optativa_electiva, \
    obtener_detalle_asignatura_cohorte
# Create your views here.



def comparar(request):
    universidad1 = obtener_todas_universidades_()  # UMCC, UNAH
    universidad2 = obtener_todas_universidades_()  # UMCC, UNAH
    context = {'universidad1': universidad1, 'universidad2': universidad2}
    return render(request, 'comparar.html', context)


@login_required()
@permission_required('planEstudio.add_cohorte')
def cohorte_duplicar(request):
    universidad1 = obtener_todas_universidades_()  # UMCC, UNAH
    context = {'universidad1': universidad1}
    return render(request, 'cohorte_duplicar.html', context)


@login_required()
@permission_required('planEstudio.add_cohorte')
def cohorte_duplicar_resultados(request):
    universidad1 = obtener_todas_universidades_()  # UMCC, UNAH
    context = {'universidad1': universidad1}
    return render(request, 'cohorte_duplicar.html', context)


def comparar_resultados(request, cohorteprev_id, cohorteact_id):
    cohorteprev = get_object_or_404(Cohorte, pk=cohorteprev_id)
    cohorteact = get_object_or_404(Cohorte, pk=cohorteact_id)
    if cohorteprev == cohorteact:
        error = True
        context = {'error': error}
        return render(request, 'comparar.html', context)
    else:
        lista_cp = obtener_asignatura_cohorte(cohorteprev)
        lista_ca = obtener_asignatura_cohorte(cohorteact)

        carrera1 = obtener_carrera_tipo_curso(cohorteprev_id)  # cantidad_anhos_carrera(cohorteprev_id)
        carrera2 = obtener_carrera_tipo_curso(cohorteact_id)  # cantidad_anhos_carrera(cohorteact_id)

        asig_opt_elec1 = obtener_asignatura_optativa_electiva()
        asig_opt_elec2 = obtener_asignatura_optativa_electiva()

        anhos1 = anhos_carrera_tipo_curso(carrera1)
        anhos2 = anhos_carrera_tipo_curso(carrera2)
        cantidad_anhos_max = max(anhos1, anhos2)  # el máximo  de años de la carrera a la que pertenece ese cohorte


        # semestre_anho1.__getitem__()

        context = {'cohorteprev': cohorteprev, 'cohorteact': cohorteact, 'anhos': cantidad_anhos_max,
                   'lista_cp': lista_cp, 'lista_ca': lista_ca, 'asig_opt_elec1': asig_opt_elec1,
                   'asig_opt_elec2': asig_opt_elec2}

    return render(request, 'comparar_resultados.html', context)


def search(request):
    query_string = ''
    # algo()
    found_entries = None
    if ('q' in request.GET) and request.GET['q'].strip():
        query_string = request.GET['q']
        # entry_query = get_query(query_string, ['nombre', 'cantidadPeriodos', 'comentarios'])
        # found_entries = watson.search(query_string, models=(PlanEstudio.objects.filter(activo=True),))
        # for obj in found_entries:
        # print(obj.nombre, obj.cantidadPeriodos)
        found_entries = watson.filter(PlanEstudio.objects.filter(activo=True), query_string)
        # for obj in watson.filter(PlanEstudio.objects.filter(activo=True), query_string):
        # print(obj.nombre, obj.cantidadPeriodos)
        # found_entries = PlanEstudio.objects.filter(entry_query, activo=True).order_by('nombre')
        paginator = Paginator(found_entries, 10)  # Show 10 contacts per page
        page = request.GET.get('page')
        try:
            planes = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            planes = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            planes = paginator.page(paginator.num_pages)
        return render_to_response('planestudio_busqueda.html',
                                  {'query_string': query_string, 'object_list': found_entries, 'page_obj': planes},
                                  context_instance=RequestContext(request))
    else:
        return render(request, 'planestudio_listar.html')

        # TODO ver esto


def searchAsignaturaCohorte(request):
    query_string = ''
    found_entries = None
    if ('q' in request.GET) and request.GET['q'].strip():
        query_string = request.GET['q']
        entry_query = get_query(query_string,
                                ['asignaturaId'])
        found_entries = AsignaturaCohorte.objects.filter(entry_query, activo=True)  # .order_by('cohorteId')

        paginator = Paginator(found_entries, 10)  # Show 10 contacts per page
        page = request.GET.get('page')
        try:
            planes = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            planes = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            planes = paginator.page(paginator.num_pages)
        return render_to_response('asignaturacohorte_busqueda.html',
                                  {'query_string': query_string, 'object_list': found_entries, 'page_obj': planes},
                                  context_instance=RequestContext(request))
    else:
        return render(request, 'asignaturacohorte_listar.html')


