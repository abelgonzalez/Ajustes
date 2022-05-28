__author__ = 'Abel'
from django.shortcuts import render, render_to_response, get_object_or_404
import json
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q
# from django_xhtml2pdf.utils import generate_pdf

# pisa's imports

from io import StringIO
import string, sys
import cgi
from django.template import RequestContext
from django.template.loader import render_to_string
from django.http import HttpResponse
# from six import with_metaclass


# modelos
from planEstudio.models import Cohorte, AsignaturaCohorte, AsignaturaOptativaElectiva, AsignaturaVencida, \
    CarreraEstudiante
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso, Carrera, TipoDeCurso, Universidad, Facultad
from planEstudio.nomencladores.nomencladorPlanEstudio import Curso, Anho, AnhoSemestre, Semestre
# formularios
from planEstudio.forms import PlanEstudioForm


def get_cohortes_planEstudio(self):
    object = Cohorte.objects.filter(planEstudioId=self.pk, activo=True)
    # object.activo = False
    # object.save()
    return object


def obtener_todas_universidades_():
    return Universidad.objects.filter(activo=True)


def obtener_facultad(universidadId):
    return CarreraTipoDeCurso.objects.filter(universidadId_id=universidadId, activo=True)


def obtener_carrera(facultadId):
    return CarreraTipoDeCurso.objects.filter(facultadId_id=facultadId, activo=True)


def obtener_tipo_curso(carreradId):
    return CarreraTipoDeCurso.objects.filter(carreraId_id=carreradId, activo=True)


def obtener_plan_estudio(carreraTipoCursoId):
    return Cohorte.objects.filter(carreraTipoCursoId=carreraTipoCursoId, activo=True)


def obtener_curso(carreraTipoCursoId, cursoId):
    return obtener_plan_estudio(carreraTipoCursoId).filter(cursoId=cursoId, activo=True)


def obtener_cohorte(carr_tipo_curso, plan_est, cursoid):
    return Cohorte.objects.filter(carreraTipoCursoId=carr_tipo_curso, planEstudioId=plan_est, cursoId=cursoid,
                                  activo=True)


def obtener_asignaturas_cohorte(cohorteId):
    return AsignaturaCohorte.objects.order_by('anhoSemestreId').filter(cohorteId=cohorteId, activo=True)


def cantidad_anhos_carrera(cohorte):
    cohorte1 = get_object_or_404(Cohorte, pk=cohorte)
    # a= cohorte1.carreraTipoCursoId
    carrrera1 = get_object_or_404(CarreraTipoDeCurso, pk=cohorte1.carreraTipoCursoId_id)
    return carrrera1.cantidadAnhos


def obtener_todos_anhos():
    return Anho.objects.filter(activo=True)


def obtener_anho_semestre(anhoId):
    return AnhoSemestre.objects.filter(anhoId=anhoId, activo=True)


def obtener_universidad(universidadId):
    return Universidad.objects.filter(pk=universidadId, activo=True)


def obtener_universidadAJAX(request):
    universidadId = request.GET['idUni']
    list = CarreraTipoDeCurso.objects.filter(universidadId=universidadId, activo=True)
    res = []
    re = True
    for i in list:
        id = i.id
        idUni = i.universidad.id
        nombre = i.nombre
        siglas = i.siglas
        activo = i.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre, 'siglas': siglas, 'idUni': idUni}
        if not res.__contains__(data) and i.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_facultadAJAX(request):
    universidadId = request.GET['idUni']
    # facultadId = request.GET['idFac']
    list = CarreraTipoDeCurso.objects.filter(universidadId_id=universidadId, activo=True)
    # list = listtmp.order_by('universidadId', 'facultadId', 'carreraId', 'tipoCursoId').distinct('universidadId',
    # 'facultadId',
    # 'carreraId',
    # 'tipoCursoId')
    res = []
    re = True
    # a = list[0]
    # y = a.facultad.nombre
    for i in list:
        id = i.facultadId.id
        nombre = i.facultadId.nombre
        activo = i.facultadId.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre}
        if not res.__contains__(data) and i.facultadId.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_carreraAJAX(request):
    universidadId = request.GET['idUni']
    facultadId = request.GET['idFac']
    list = CarreraTipoDeCurso.objects.filter(universidadId_id=universidadId, facultadId_id=facultadId, activo=True)
    res = []
    re = True
    for i in list:
        id = i.carreraId.id
        nombre = i.carreraId.nombre
        activo = i.carreraId.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre}
        if not res.__contains__(data) and i.carreraId.activo:
            res.append(data)

    return HttpResponse(json.dumps(res))


def obtener_tipocursoAJAX(request):
    universidadId = request.GET['idUni']
    facultadId = request.GET['idFac']
    carreraId = request.GET['idCar']
    list = CarreraTipoDeCurso.objects.filter(universidadId_id=universidadId, facultadId_id=facultadId,
                                             carreraId_id=carreraId, activo=True)
    re = True
    res = []
    for i in list:
        id = i.tipoCursoId.id
        nombre = i.tipoCursoId.nombre
        activo = i.tipoCursoId.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre}
        if not res.__contains__(data) and i.tipoCursoId.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_plandeestudioAJAX(request):
    universidadId = request.GET['idUni']
    facultadId = request.GET['idFac']
    carreraId = request.GET['idCar']
    tipoCursoId = request.GET['idCarTipo']
    cartipocursoId = get_object_or_404(CarreraTipoDeCurso, universidadId=universidadId, facultadId=facultadId,
                                       carreraId=carreraId, tipoCursoId=tipoCursoId, activo=True)
    list = Cohorte.objects.filter(carreraTipoCursoId=cartipocursoId, activo=True)
    res = []
    re = True

    for i in list:
        id = i.planEstudioId.id
        nombre = i.planEstudioId.nombre
        activo = i.planEstudioId.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre}
        # dale.append(data)
        if not res.__contains__(data) and i.planEstudioId.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_cursoAJAX(request):
    universidadId = request.GET['idUni']
    facultadId = request.GET['idFac']
    carreraId = request.GET['idCar']
    tipoCursoId = request.GET['idCarTipo']
    cartipocursoId = get_object_or_404(CarreraTipoDeCurso, universidadId=universidadId, facultadId=facultadId,
                                       carreraId=carreraId, tipoCursoId=tipoCursoId, activo=True)
    planId = request.GET['idPlanE']
    list = Cohorte.objects.filter(planEstudioId=planId, carreraTipoCursoId=cartipocursoId, activo=True)
    re = True
    res = []
    for i in list:
        id = i.cursoId.id
        nombre = i.cursoId.nombre
        activo = i.cursoId.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre}
        if not res.__contains__(data) and i.cursoId.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_cohorteAJAX(request):
    universidadId = request.GET['idUni']
    facultadId = request.GET['idFac']
    carreraId = request.GET['idCar']
    tipoCursoId = request.GET['idCarTipo']
    cartipocursoId = get_object_or_404(CarreraTipoDeCurso, universidadId=universidadId, facultadId=facultadId,
                                       carreraId=carreraId, tipoCursoId=tipoCursoId, activo=True)
    planId = request.GET['idPlanE']
    cursoId = request.GET['idCurso']
    list = Cohorte.objects.filter(carreraTipoCursoId_id=cartipocursoId, planEstudioId_id=planId,
                                  cursoId_id=cursoId, activo=True)
    re = True
    res = []
    for i in list:
        id = i.id
        comentario = i.comentario
        activo = i.activo
        data = {'id': id, 'comentario': comentario, 'activo': activo}
        if not res.__contains__(data) and i.activo:
            res.append(data)
    return HttpResponse(json.dumps(res))


def obtener_UniFaculAJAX(request):
    listUni = Universidad.objects.filter(activo=True)
    listFac = Facultad.objects.filter(activo=True)
    listCarr = Carrera.objects.filter(activo=True)
    res = []
    auxUni = []
    auxFac = []
    auxCarr = []
    for i in listUni:
        id = i.id
        nombre = i.nombre
        siglas = i.siglas
        activo = i.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre, 'siglas': siglas}
        auxUni.append(data)

    for i in listFac:
        id = i.id
        nombre = i.nombre
        siglas = i.siglas
        idUni = i.universidad.id
        activo = i.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre, 'siglas': siglas, 'idUni': idUni}
        auxFac.append(data)

    for i in listCarr:
        id = i.id
        nombre = i.nombre
        idFac = i.facultad.id
        activo = i.activo
        data = {'id': id, 'activo': activo, 'nombre': nombre, 'idFac': idFac}
        auxCarr.append(data)
    res.append(auxUni)
    res.append(auxFac)
    res.append(auxCarr)
    return HttpResponse(json.dumps(res))


def obtener_selec_anho_semestre(anhoId, semestreId):
    return AnhoSemestre.objects.order_by('pk').filter(anhoId=anhoId, semestreId=semestreId, activo=True)


def obtener_todo_anho_semestre():
    return AnhoSemestre.objects.filter(activo=True)


def obtener_anho(anhoId):
    return Anho.objects.order_by('pk').filter(pk=anhoId, activo=True)


def obtener_semestre(semestreId):
    return Semestre.objects.filter(pk=semestreId, activo=True)


def obtener_asignaturas(anhoSemestreId, cohorteId):
    return AsignaturaCohorte.objects.order_by('anhoSemestreId').filter(anhoSemestreId=anhoSemestreId,
                                                                       cohorteId=cohorteId, activo=True)


def obtener_carrera_tipo_curso(cohorte_id):
    idCoho = get_object_or_404(Cohorte, pk=cohorte_id).carreraTipoCursoId_id
    tmp = CarreraTipoDeCurso.objects.filter(pk=idCoho, activo=True)
    return tmp


def anhos_carrera_tipo_curso(carreratipocursoId):
    return get_object_or_404(CarreraTipoDeCurso, pk=carreratipocursoId, activo=True).cantidadAnhos


def obtener_asignatura_cohorte(cohorte_id):
    ostia = AsignaturaCohorte.objects.order_by('anhoSemestreId').filter(cohorteId=cohorte_id, activo=True)
    return ostia


def obtener_asignatura_vencida_cohorte(cohorte_id):
    ostia = AsignaturaCohorte.objects.order_by('anhoSemestreId').filter(cohorteId=cohorte_id,
                                                                        activo=True)  # hay que ordenarlo primerooo
    loko = []
    for a in ostia:
        try:
            tmp = AsignaturaVencida.objects.filter(asignaturaCohorteId=a)
            loko.append(a)
        except:
            pass
    return loko


def obtener_asignatura_optativa_electiva():
    return AsignaturaOptativaElectiva.objects.filter(activo=True)


def obtener_asignatura_optativa_electiva_asignatura(asignaturaCohorteId):
    return AsignaturaOptativaElectiva.objects.filter(asignaturaCohorteId=asignaturaCohorteId, activo=True)


def obtener_detalle_asignatura_cohorte(asignaturaCohorteId):
    return get_object_or_404(AsignaturaCohorte, pk=asignaturaCohorteId, activo=True)


def asignaturas_vencidas_estudiante_cohorte(estudianteId, cohorteId):
    carreraEst = get_object_or_404(CarreraEstudiante, estudianteId=estudianteId, cohorteId=cohorteId)
    asignVencidas = AsignaturaVencida.objects.filter(carreraEstudianteId=carreraEst, activo=True)
    return asignVencidas


def asignaturas_vencidas_estudiante_cohorte(estudianteId, cohorteId):
    carreraEst = get_object_or_404(CarreraEstudiante, estudianteId=estudianteId, cohorteId=cohorteId)
    asignVencidas = AsignaturaVencida.objects.filter(carreraEstudianteId=carreraEst, activo=True)
    return asignVencidas