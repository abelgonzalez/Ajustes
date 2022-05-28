__author__ = 'Abel'
import json
from django.http import HttpResponse
from persona.models import Estudiante
from planEstudio.models import Cohorte, CarreraEstudiante
from django.shortcuts import render, render_to_response, get_object_or_404
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy, reverse
from ajustes.models import AjusteEstudiante, AjusteAsignatura, AjusteAsignaturaConvalidada, AprobacionDeAjuste
from planEstudio.metodos import obtener_asignatura_optativa_electiva, obtener_asignatura_cohorte, \
    obtener_asignatura_vencida_cohorte, obtener_todas_universidades_, obtener_asignaturas_cohorte
from ajustes.nomencladores.nomencladorAjuste import Situacion
from planEstudio.models import AsignaturaCohorte, AsignaturaVencida
from persona.nomencladores.nomencladorEstudiante import CarreraTipoDeCurso
from planEstudio.nomencladores.nomencladorPlanEstudio import Anho, Semestre, AnhoSemestre
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_nuevo1, log_editar, log_editar1, \
    log_eliminar, log_eliminar1
from persona.models import Trabajador
from django.contrib.auth.decorators import login_required, permission_required

from planEstudio.models import PlanEstudio


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def validar_datos_ajusteAJAX(request):
    request.session['carreraestudiante'] = request.GET['carreraestudiante']
    request.session['motivo'] = request.GET['motivo']
    request.session['documentacion'] = request.GET['documentacion']
    request.session['curso'] = request.GET['curso']

    mensaje = ''
    existe = True
    try:
        carreraestud = get_object_or_404(CarreraEstudiante, pk=request.GET['carreraestudiante'])
        ajuste_estud = AjusteEstudiante.objects.filter(carreraEstudianteId=carreraestud)
        if ajuste_estud:
            mensaje = 'A este estudiante ya se le hizo ajuste a plan'
    except:
        existe = False
    args = {'existe': existe, 'mensaje': mensaje}
    return HttpResponse(json.dumps(args))


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def datos_ajusteAJAX(request):
    carreraestudiante = request.session['carreraestudiante']
    motivo = request.session['motivo']
    documentacion = request.session['documentacion']
    curso = request.session['curso']

    ajuste_estudiante = AjusteEstudiante(carreraEstudianteId_id=carreraestudiante, motivoAjusteId_id=motivo,
                                         documentacionAnalizadaId_id=documentacion, cursoAjusteId_id=curso)
    args = {'object': ajuste_estudiante}
    return render(request, '_datos_ajuste_estudiante.html', args)


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def listAsigCohorteAJAX(request, cohorteId):
    request.session['cohorte'] = cohorteId
    asig_list = obtener_asignaturas_cohorte(cohorteId)
    optat_elect = obtener_asignatura_optativa_electiva()
    situacion = Situacion.objects.order_by('pk').filter(activo=True)
    carrest = request.session['carreraestudiante']
    asignVenc = AsignaturaVencida.objects.filter(carreraEstudianteId=carrest)
    try:
        ajuste_estud = request.session['ajusteestudiante']
        ajuste_estud = get_object_or_404(AjusteEstudiante, pk=ajuste_estud)
        ajuste_list = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajuste_estud, activo=True)
        ajuste_asignatura = []
        asignatura_convalidada = []
        for a in ajuste_list:
            ajuste_asignatura.append(a)
            if a.situacionId_id == 3:
                asig_conv_list = AjusteAsignaturaConvalidada.objects.filter(ajusteAsignaturaId=a)
                for b in asig_conv_list:
                    try:
                        asignatura_convalidada.append(b)
                    except:
                        pass
        args = {'listAsigCohorte': asig_list, 'asig_opt_elec1': optat_elect, 'situacion': situacion,
                'asignVenc': asignVenc, 'ajuste_asignatura': ajuste_asignatura,
                'asignatura_convalidada': asignatura_convalidada}
    except:
        args = {'listAsigCohorte': asig_list, 'asig_opt_elec1': optat_elect, 'situacion': situacion,
                'asignVenc': asignVenc}


    # estudiante = get_object_or_404(Estudiante, pk=est_id)
    # carrest = get_object_or_404(CarreraEstudiante, estudianteId_id=carrestt1, activo=True)
    # carr_est = CarreraEstudiante.objects.filter(
    # estudianteId=estudiante).first()  # TODO acá ampliar y hacer un ciclo para obtener todas las asignaturas vencidas en todas las carreras

    return render(request, 'cohorte_select_ajuste.html', args)


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def anho_semestre(request, cohorteId):
    cohorte = get_object_or_404(Cohorte, pk=cohorteId)
    periodos = cohorte.planEstudioId.cantidadPeriodos
    cantperiodos = int(periodos)
    anho_semestre = AnhoSemestre.objects.order_by('anhoId').filter(activo=True)

    lista_anho_semestre = []
    periodos = 1
    for a in anho_semestre:
        if periodos <= cantperiodos:
            lista_anho_semestre.append(a)
            periodos += 1

    args = {'lista_anho_semestre': lista_anho_semestre}
    return render(request, '_datos_anho_semestre.html', args)


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def obtener_ajusteestudianteAJAX(request):
    tamanho = request.GET['tamanho']
    request.session['tamanho'] = tamanho
    tm = int(tamanho)
    data = ''
    for a in range(0, tm):
        a_ = str(a)
        id_asignatura = request.GET['ajustes_resultado[' + a_ + '][id_asignatura]']
        id_situacion = request.GET['ajustes_resultado[' + a_ + '][situacion]']
        convalidadas1 = request.GET['ajustes_resultado[' + a_ + '][convalidadas]']
        # id_convalidada = convalidadas1.split('-')

        data += ('>' + id_asignatura + ',' + id_situacion + '^' + convalidadas1)

    # request.session['resultados_ajuste'] = 1
    # request.session['resultados_ajuste'] = 'bla sds'
    request.session['resultados_ajuste'] = data

    args = {'datos': data}

    return HttpResponse(json.dumps(args))


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def datos_ajusteestudiante(request):
    datos = request.session['resultados_ajuste']
    carreraestudiante = request.session['carreraestudiante']
    motivo = request.session['motivo']
    documentacion = request.session['documentacion']
    curso = request.session['curso']
    cohorteId = request.session['cohorte']

    ajusteEstudiante = AjusteEstudiante(carreraEstudianteId_id=carreraestudiante, motivoAjusteId_id=motivo,
                                        cohortePropuestoId_id=cohorteId, documentacionAnalizadaId_id=documentacion,
                                        cursoAjusteId_id=curso)

    estudiante = ajusteEstudiante.carreraEstudianteId.estudianteId

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

    vencida_marca = AsignaturaVencida.objects.filter(carreraEstudianteId=carreraestudiante)
    list_vencidas_marca = []
    for a in vencida_marca:
        list_vencidas_marca.append(a)

    listAsigVencidas = []
    for a in asigVencidas:
        listAsigVencidas.append(a)

    lista_ca = listAsigVencidas
    asig_opt_elec1 = obtener_asignatura_optativa_electiva()

    # acá se genera el ajuste de asignaturas:

    lista_ajuste = datos.split('>')  # separando las tuplas de asignaturas y vencidas
    listaAsigAjustadas = []
    listaAsigConvalidadas = []

    for a in lista_ajuste:
        try:
            asigcoho = a.split(',')
            asco = int(asigcoho[0])  # las asignaturas
            aa = asigcoho[1].split('^')  # para las convalidadas
            situac = int(aa[0])  # acá están todas las convalidadas
            conval = aa[1].split('-')  # separando las convalidadas

            ajusteasignatura = AjusteAsignatura(ajusteEstudianteId=ajusteEstudiante, asignaturaCohorteId_id=asco,
                                                situacionId_id=situac)
            listaAsigAjustadas.append(ajusteasignatura)

            if situac == 3:  # si es convalidada, entonces la guardo
                carrrr = int(carreraestudiante)
                asq = int(aa[1])
                asigve = get_object_or_404(AsignaturaVencida, carreraEstudianteId_id=carrrr,
                                           asignaturaCohorteId_id=asq)
                ajusasigconval = AjusteAsignaturaConvalidada(ajusteAsignaturaId=ajusteasignatura,
                                                             asignaturaVencidaId=asigve)
                listaAsigConvalidadas.append(ajusasigconval)

        except:
            pass

    args = {'estudiante': estudiante, 'lista_cp': lista_cp, 'asig_opt_elec2': asig_opt_elec2,
            'cohorteprev': cohorteprev, 'cohorteact': cohorteact, 'lista_ca': lista_ca,
            'asig_opt_elec1': asig_opt_elec1, 'listaAsigAjustadas': listaAsigAjustadas,
            'listaAsigConvalidadas': listaAsigConvalidadas, 'list_vencidas_marca': list_vencidas_marca}
    return render(request, '_comparativa_ajuste_asistente.html', args)


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def ajuste_guardar(request, anhoSemestreId):
    carreraestudiante = request.session['carreraestudiante']
    motivo = request.session['motivo']
    documentacion = request.session['documentacion']
    curso = request.session['curso']
    cohorteId = request.session['cohorte']
    chrte = int(cohorteId)

    ajusteEstudiante = AjusteEstudiante(carreraEstudianteId_id=carreraestudiante, motivoAjusteId_id=motivo,
                                        documentacionAnalizadaId_id=documentacion, cursoAjusteId_id=curso,
                                        anhoSemestreAjustadoId_id=anhoSemestreId, cohortePropuestoId_id=chrte)

    ajusteEstudiante.save()
    log_nuevo1(ajusteEstudiante, request)

    datos = request.session['resultados_ajuste']
    lista_ajuste = datos.split('>')  # separando las tuplas de asignaturas y vencidas

    for a in lista_ajuste:
        try:
            asigcoho = a.split(',')
            asco = int(asigcoho[0])  # las asignaturas
            aa = asigcoho[1].split('^')  # para las convalidadas
            situac = int(aa[0])  # acá están todas las convalidadas
            conval = aa[1].split('-')  # separando las convalidadas

            ajusteasignatura = AjusteAsignatura(ajusteEstudianteId=ajusteEstudiante, asignaturaCohorteId_id=asco,
                                                situacionId_id=situac)
            # listaAsigAjustadas.append(ajusteasignatura)
            ajusteasignatura.save()
            log_nuevo1(ajusteasignatura, request)

            if situac == 3:  # si es convalidada, entonces la guardo
                for b in conval:
                    try:  # siempre usar try /catch por si viene un caracter extraño
                        carrrr = int(carreraestudiante)
                        b = int(b)
                        asigve = get_object_or_404(AsignaturaVencida, carreraEstudianteId_id=carrrr,
                                                   asignaturaCohorteId_id=b)
                        ajusasigconval = AjusteAsignaturaConvalidada(ajusteAsignaturaId=ajusteasignatura,
                                                                     asignaturaVencidaId=asigve)
                        # listaAsigConvalidadas.append(ajusasigconval)
                        ajusasigconval.save()
                        log_nuevo1(ajusasigconval, request)
                    except:
                        pass
        except:
            pass

    trabajad = get_object_or_404(Trabajador, pk=request.user.pk)
    aprobAj = AprobacionDeAjuste.objects.filter(carreraEstId_id=carreraestudiante).last()
    aprobAj.trabajadorId = trabajad
    aprobAj.carreraEstId_id = carreraestudiante
    aprobAj.ajusteEstudianteId_id = ajusteEstudiante.pk
    aprobAj.estadoId_id = 5
    aprobAj.save()
    log_editar1(aprobAj, request)
    eliminar_variables_sesion(request)

    return HttpResponseRedirect(reverse('ajustes:ajusteestudiante_listar'))


def eliminar_variables_sesion(request):
    try:
        del request.session['carreraestudiante']
    except:
        pass
    try:
        del request.session['motivo']
    except:
        pass
    try:
        del request.session['documentacion']
    except:
        pass
    try:
        del request.session['curso']
    except:
        pass
    try:
        del request.session['cohorte']
    except:
        pass
    try:
        del request.session['resultados_ajuste']
    except:
        pass
    try:
        del request.session['tamanho']
    except:
        pass
    try:
        del request.session['listAsigCohorte']
    except:
        pass
    try:
        del request.session['ajusteestudiante']
    except:
        pass


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def ajuste_editar_guardar(request, pk):
    carreraestudiante = request.session['carreraestudiante']
    motivo = request.session['motivo']
    documentacion = request.session['documentacion']
    curso = request.session['curso']
    cohorteId = request.session['cohorte']
    chrte = int(cohorteId)

    ajusteEstudiante = get_object_or_404(AjusteEstudiante, carreraEstudianteId_id=carreraestudiante)
    list_aj_asig = []
    list_aj_asig_conv = []
    ajustAsign = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True)
    for a in ajustAsign:  # desactivando las asignaturas
        list_aj_asig.append(a)
        a.activo = False
        if a.situacionId_id == 3:
            ajustConv = AjusteAsignaturaConvalidada.objects.filter(ajusteAsignaturaId=a)
            for b in ajustConv:
                list_aj_asig_conv.append(b)
                b.activo = False
                b.save()

    # ajusteEstudiante.save()
    # log_nuevo1(ajusteEstudiante, request)

    datos = request.session['resultados_ajuste']
    lista_ajuste = datos.split('>')  # separando las tuplas de asignaturas y vencidas
    ajusteasignatura1 = ''
    for a in lista_ajuste:
        try:
            asigcoho = a.split(',')
            asco = int(asigcoho[0])  # las asignaturas
            aa = asigcoho[1].split('^')  # para las convalidadas
            situac = int(aa[0])  # acá están todas las convalidadas
            conval = aa[1].split('-')  # separando las convalidadas
            ajuste_asig = get_object_or_404(AjusteAsignatura, ajusteEstudianteId=ajusteEstudiante,
                                            asignaturaCohorteId_id=asco)
            ajuste_asig.activo = True
            ajuste_asig.situacionId_id = situac
            ajuste_asig.save()
            log_editar1(ajuste_asig, request)
            if situac == 3:
                for b in conval:
                    # list_aj_asig_conv.append(b)
                    carrrr = int(carreraestudiante)
                    carres = get_object_or_404(CarreraEstudiante, pk=carrrr)
                    vencida = get_object_or_404(AsignaturaVencida, carreraEstudianteId=carres, asignaturaCohorteId=b)
                    try:  # si existe, actualizo
                        asigve = get_object_or_404(AjusteAsignaturaConvalidada, ajusteAsignaturaId=ajuste_asig,
                                                   asignaturaVencidaId=vencida)
                        asigve.activo = True
                        asigve.save()
                        log_editar1(asigve, request)
                    except:
                        # como es nueva, la creo....
                        ajusasigconval = AjusteAsignaturaConvalidada(ajusteAsignaturaId=ajuste_asig,
                                                                     asignaturaVencidaId=vencida)
                        ajusasigconval.save()
                        log_nuevo1(ajusasigconval, request)
                ajusasigconval.save()
                log_nuevo1(ajusasigconval, request)
        except:
            pass

    trabajad = get_object_or_404(Trabajador, pk=request.user.pk)
    aprobAj = AprobacionDeAjuste.objects.filter(carreraEstId_id=carreraestudiante).last()
    aprobAj.trabajadorId = trabajad
    aprobAj.carreraEstId_id = carreraestudiante
    aprobAj.ajusteEstudianteId_id = ajusteEstudiante.pk
    aprobAj.estadoId_id = 5
    aprobAj.save()
    log_editar1(aprobAj, request)
    eliminar_variables_sesion(request)

    return HttpResponseRedirect(reverse('ajustes:ajusteestudiante_listar'))