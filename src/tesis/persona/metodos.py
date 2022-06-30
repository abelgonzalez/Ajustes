__author__ = 'Abel'
import json
from django.http import HttpResponse
from persona.models import Estudiante
from django.contrib.auth.decorators import login_required, permission_required
from django.shortcuts import render, render_to_response, get_object_or_404


@login_required()
@permission_required('persona.add_estudiante')
def validar_datos_estudianteAJAX(request):
    request.session['carne'] = request.GET['carne']
    request.session['nombre'] = request.GET['nombre']
    request.session['apellidos'] = request.GET['apellidos']
    request.session['direccion'] = request.GET['direccion']
    request.session['ubicacion'] = request.GET['ubicacion']
    request.session['nacionalidad'] = request.GET['nacionalidad']
    request.session['sexo'] = request.GET['sexo']
    request.session['etnia'] = request.GET['etnia']
    request.session['correo'] = request.GET['correo']
    request.session['fechaIngESup'] = request.GET['fechaIngESup']
    request.session['indice'] = request.GET['indice']
    mensaje = ''
    error_general = False

    try:
        resul = _valida_requerido(request.GET['indice'])
        error = resul['error']
        mensaje = 'El índice académico, ' + resul['mensaje']
        args = {'error': error, 'mensaje': mensaje}
        if error:
            error_general = True
            return HttpResponse(json.dumps(args))
    except:
        pass

    try:
        resul = _valida_requerido(request.GET['nombre'])
        error = resul['error']
        mensaje = 'El nombre del estudiante, ' + resul['mensaje']
        args = {'error': error, 'mensaje': mensaje}
        if error:
            error_general = True
            return HttpResponse(json.dumps(args))
    except:
        pass

    try:
        resul = _valida_numeros(request.GET['carne'])
        error = resul['error']
        mensaje = 'En el carné de identidad, ' + resul['mensaje']
        args = {'error': error, 'mensaje': mensaje}
        if error:
            error_general = True
            return HttpResponse(json.dumps(args))
    except:
        pass

    try:
        resul = _valida_requerido(request.GET['carne'])
        error = resul['error']
        mensaje = 'El carné de identidad, ' + resul['mensaje']
        args = {'error': error, 'mensaje': mensaje}
        if error:
            error_general = True
            return HttpResponse(json.dumps(args))
    except:
        pass

    try:
        resul = _valida_cantidad_numeros_CI(request.GET['carne'])
        error = resul['error']
        mensaje = 'El carné de identidad, ' + resul['mensaje']
        args = {'error': error, 'mensaje': mensaje}
        if error:
            error_general = True
            return HttpResponse(json.dumps(args))
    except:
        pass

    try:
        a = request.session['nuevo']
        carne = int(request.GET['carne'])
        estudiante = get_object_or_404(Estudiante, carneIdentidad=carne)
        if estudiante:
            mensaje = 'Este estudiante ya existe'
            error = True
            args = {'error': error, 'mensaje': mensaje}
            if error:
                error_general = True
                return HttpResponse(json.dumps(args))
    except:
        pass

    args = {'error': error_general, 'mensaje': mensaje}
    return HttpResponse(json.dumps(args))


def _valida_numeros(valor):
    error = False
    mensaje = ''
    resultados = {'error': error, 'mensaje': mensaje}
    if not valor.__contains__(1) or valor.__contains__(
            2) or valor.__contains__(
            3) or valor.__contains__(
            4) or valor.__contains__(
            5) or valor.__contains__(
            6) or valor.__contains__(
            7) or valor.__contains__(
            8) or valor.__contains__(
            9) or valor.__contains__(
            0):
        error = True
        mensaje = 'solo números, por favor.'
        resultados = {'error': error, 'mensaje': mensaje}
    return resultados


def _valida_requerido(valor):
    error = False
    mensaje = ''
    resultados = {'error': error, 'mensaje': mensaje}
    if valor == '':
        error = True
        mensaje = 'es requerido.'
        resultados = {'error': error, 'mensaje': mensaje}
    return resultados


def _valida_cantidad_numeros_CI(valor):
    error = False
    mensaje = ''
    resultados = {'error': error, 'mensaje': mensaje}
    if not valor.__len__() == 11:
        error = True
        mensaje = 'debe tener 11 dígitos.'
        resultados = {'error': error, 'mensaje': mensaje}
    return resultados


@login_required()
@permission_required('persona.add_estudiante')
def datos_estudiante_vencidasAJAX(request):
    list_vencidas = request.GET['send']
    return HttpResponse(json.dumps(list_vencidas))


@login_required()
@permission_required('persona.add_estudiante')
def validar_estudiante_carrera(request):
    return True


@login_required()
@permission_required('persona.add_estudiante')
def validar_asignaturas_vencidas(request):
    return True