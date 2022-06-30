from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
import json
from django.contrib.auth.decorators import login_required, permission_required

from planEstudio.metodos import obtener_asignatura_optativa_electiva, obtener_asignaturas_cohorte, \
    asignaturas_vencidas_estudiante_cohorte
from persona.models import Estudiante
from planEstudio.models import CarreraEstudiante, AsignaturaVencida, AsignaturaCohorte, Cohorte

@login_required()
@permission_required('persona.add_estudiante')
def datos_estudianteAJAX(request):
    carne = request.session['carne']
    nombre = request.session['nombre']
    apellidos = request.session['apellidos']
    direccion = request.session['direccion']
    ubicacion = request.session['ubicacion']
    nacionalidad = request.session['nacionalidad']
    sexo = request.session['sexo']
    etnia = request.session['etnia']
    correo = request.session['correo']
    fechaIngESup = request.session['fechaIngESup']
    indice = request.session['indice']
    est = Estudiante(carneIdentidad=carne, nombre=nombre, apellidos=apellidos, direccion=direccion,
                     ubicacionId_id=ubicacion, nacionalidadId_id=nacionalidad,
                     sexoId_id=sexo, etniaId_id=etnia, correoElectronico=correo, fechaIngESup=fechaIngESup,
                     indiceAcademico=indice)
    args = {'object': est}
    return render(request, '_datos_estudiante.html', args)


@login_required()
@permission_required('persona.add_estudiante')
def listAsigCohorteAJAX(request, cohorteId):
    asig_list = obtener_asignaturas_cohorte(cohorteId)
    optat_elect = obtener_asignatura_optativa_electiva()
    request.session['cohorte'] = cohorteId
    try:
        carrest = request.session['carreraestudiante']
        asign_vencidas = AsignaturaVencida.objects.filter(carreraEstudianteId_id=carrest, activo=True)
        asigV = []
        for a in asign_vencidas:
            asigV.append(a)
        args = {'listAsigCohorte': asig_list, 'asig_opt_elec1': optat_elect, 'asign_vencidas': asigV}
    except:
        args = {'listAsigCohorte': asig_list, 'asig_opt_elec1': optat_elect}

    return render(request, 'cohorte_select.html', args)

@login_required()
@permission_required('persona.add_estudiante')
def datos_estudiante_vencidas(request, asignaturas):
    list_vencidas = asignaturas
    asignaturas_vencidas = list_vencidas.split('-')

    listAsigCohorte = []
    for a in asignaturas_vencidas:
        try:
            az = get_object_or_404(AsignaturaCohorte, pk=a)
            listAsigCohorte.append(az)
        except:
            pass

    args = {'asigvenc': listAsigCohorte}
    request.session['listAsigCohorte'] = asignaturas

    return render(request, '_datos_estudiante_vencidas1.html', args)


