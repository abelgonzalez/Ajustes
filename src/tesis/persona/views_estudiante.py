__author__ = 'Abel'
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_nuevo1, log_editar, log_editar1, \
    log_eliminar, log_eliminar1
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView, DeletionMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy, reverse

from django.shortcuts import render, render_to_response, get_object_or_404, get_list_or_404
from django.shortcuts import get_object_or_404
# from extra_views import InlineFormSet, CreateWithInlinesView, UpdateWithInlinesView
from persona.models import Estudiante
from persona.forms import EstudianteForm  # , EstudianteFormSet
from ajustes.models import AjusteEstudiante, AprobacionDeAjuste, AsignaturaVencida, AsignaturaCohorte
from planEstudio.models import CarreraEstudiante, Cohorte, PlanEstudio
from planEstudio.metodos import obtener_todas_universidades_, obtener_asignatura_optativa_electiva, \
    obtener_asignaturas_cohorte
from persona.nomencladores.nomencladorPersona import Nacionalidad, Sexo, Etnia, Ubicacion
from persona.nomencladores.nomencladorEstudiante import Universidad, Facultad, Carrera, TipoDeCurso
from persona.models import Estudiante, Trabajador
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre, Curso
from django.template import RequestContext


@class_view_decorator(login_required)
class EstudianteListView(PaginationMixin, ListView):
    paginate_by = 10
    model = CarreraEstudiante
    # queryset = Estudiante.objects.filter(activo=True)
    template_name = "estudiante_listar.html"

    def get_context_data(self, **kwargs):
        ctx = super(EstudianteListView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'persona', 'estudiante')
        # carrera = self.get_object()
        # carreraestudiante = CarreraEstudiante.objects.orderby('cohorteId').filter(estudianteId=carrera.pk).last()
        # ctx['carreraestudiante'] = carreraestudiante
        return ctx


    def get_queryset(self):
        # atributos = ['nombre', 'cantidadPeriodos', 'comentarios']
        # object_list = CarreraEstudiante.objects.order_by('estudianteId', 'cohorteId').last()
        list_temp = []
        object_list = []
        list_carrera = CarreraEstudiante.objects.filter(activo=True).order_by('-fechaIngreso')
        for obj in list_carrera:
            if not list_temp.__contains__(obj.estudianteId):
                list_temp.append(obj.estudianteId)
                object_list.append(obj)
        return object_list


@class_view_decorator(login_required)
class EstudianteBuscarListView(PaginationMixin, ListView):
    paginate_by = 1000
    model = CarreraEstudiante
    template_name = "estudiante_busqueda.html"

    def get_context_data(self, **kwargs):
        ctx = super(EstudianteBuscarListView, self).get_context_data(**kwargs)
        ctx['criterio'] = self.request.REQUEST.get("q")
        ctx = visibilidad(self, ctx, 'persona', 'estudiante')
        # carrera = self.get_object()
        # carreraestudiante = CarreraEstudiante.objects.filter(estudianteId=carrera.pk)
        # ctx['carreraestudiante'] = carreraestudiante
        return ctx

    def get_queryset(self):
        atributos = ['carneIdentidad', 'nombre', 'apellidos']
        object_list = busqueda(self, atributos, Estudiante)
        return object_list


@login_required()
@permission_required('persona.add_estudiante')
def estudiante_nuevo(request):
    ubicacion = Ubicacion.objects.filter(activo=True)
    nacionalidad = Nacionalidad.objects.filter(activo=True)
    sexo = Sexo.objects.filter(activo=True)
    etnia = Etnia.objects.filter(activo=True)
    universidad = Universidad.objects.filter(activo=True)
    request.session['nuevo'] = True

    args = {'ubicacion': ubicacion, 'nacionalidad': nacionalidad, 'sexo': sexo, 'etnia': etnia,
            'universidad1': universidad}
    return render(request, 'estudiante_nuevo.html', args)


@login_required()
@permission_required('persona.add_estudiante')
@permission_required('planEstudio.add_carreraestudiante')
@permission_required('planEstudio.add_asignaturavencida')
def expediente_guardar(request):
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
    num1 = request.session['indice'][0]
    try:
        num2 = request.session['indice'][2]
    except:
        num2 = '0'
    try:
        num3 = request.session['indice'][3]
    except:
        num3 = '0'
    q1 = num1 + '.' + num2 + num3
    indice_float = float(q1)  # convirtiendo a decimal
    est = Estudiante(carneIdentidad=carne, nombre=nombre, apellidos=apellidos, direccion=direccion,
                     ubicacionId_id=ubicacion, nacionalidadId_id=nacionalidad,
                     sexoId_id=sexo, etniaId_id=etnia, correoElectronico=correo, fechaIngESup=fechaIngESup,
                     indiceAcademico=indice_float)

    est.save()
    log_nuevo1(est, request)

    coho = request.session['cohorte']
    carrest = CarreraEstudiante(estudianteId=est, cohorteId_id=coho)
    carrest.save()
    log_nuevo1(carrest, request)

    vencidas = request.session['listAsigCohorte']
    asignaturas_vencidas = vencidas.split('-')
    for a in asignaturas_vencidas:
        try:
            asigcoho = get_object_or_404(AsignaturaCohorte, pk=a)
            av = AsignaturaVencida(carreraEstudianteId=carrest, asignaturaCohorteId=asigcoho)
            av.save()
            log_nuevo1(carrest, request)
        except:
            pass
            # guardarlo en aprobacionDeAjuste
    trabajad = get_object_or_404(Trabajador, pk=request.user.pk)
    aprobAj = AprobacionDeAjuste(trabajadorId=trabajad, carreraEstId=carrest, estadoId_id=1)
    aprobAj.save()
    log_nuevo1(aprobAj, request)
    eliminar_variables_sesion(request)
    return HttpResponseRedirect(reverse('persona:estudiante_listar'))


def eliminar_variables_sesion(request):
    del request.session['carne']
    del request.session['nombre']
    del request.session['apellidos']
    del request.session['direccion']
    del request.session['ubicacion']
    del request.session['nacionalidad']
    del request.session['sexo']
    del request.session['etnia']
    del request.session['correo']
    del request.session['fechaIngESup']
    del request.session['indice']
    del request.session['cohorte']
    try:
        del request.session['nuevo']
    except:
        pass


@login_required()
@permission_required('persona.change_estudiante')
@permission_required('planEstudio.change_carreraestudiante')
@permission_required('planEstudio.change_asignaturavencida')
def estudiante_editar(request, pk):
    carreraestudiante = get_object_or_404(CarreraEstudiante, pk=pk)
    estud = get_object_or_404(Estudiante, pk=carreraestudiante.estudianteId_id)
    ubicacion = Ubicacion.objects.filter(activo=True)
    ubicacion_selected = get_object_or_404(Ubicacion, pk=estud.ubicacionId_id).pk
    nacionalidad = Nacionalidad.objects.filter(activo=True)
    nacionalidad_selected = get_object_or_404(Nacionalidad, pk=estud.nacionalidadId_id).pk
    sexo = Sexo.objects.filter(activo=True)
    sexo_selected = get_object_or_404(Sexo, pk=estud.sexoId_id).pk
    etnia = Etnia.objects.filter(activo=True)
    etnia_selected = get_object_or_404(Etnia, pk=estud.etniaId_id).pk
    universidad1 = obtener_todas_universidades_()
    cohorte = get_object_or_404(Cohorte, pk=carreraestudiante.cohorteId_id)
    univ = cohorte.carreraTipoCursoId.universidadId.pk
    fac = cohorte.carreraTipoCursoId.facultadId.pk
    carr = cohorte.carreraTipoCursoId.carreraId.pk
    tipocurso = cohorte.carreraTipoCursoId.tipoCursoId.pk
    plan = cohorte.planEstudioId.pk
    curso = cohorte.cursoId.pk
    request.session['carreraestudiante'] = carreraestudiante.pk
    args = {'estudiante': estud, 'ubicacion': ubicacion, 'ubicacion_selected': ubicacion_selected,
            'nacionalidad': nacionalidad, 'nacionalidad_selected': nacionalidad_selected, 'sexo': sexo,
            'sexo_selected': sexo_selected, 'etnia': etnia, 'etnia_selected': etnia_selected,
            'carreraestudiante': carreraestudiante, 'universidad1': universidad1,
            'cohorte_selected': cohorte, 'univ_selected': univ, 'fac_selected': fac,
            'carr_selected': carr, 'tipocurso_selected': tipocurso, 'plan_selected': plan,
            'curso_selected': curso}
    return render(request, 'estudiante_editar.html', args)


@login_required()
@permission_required('persona.change_estudiante')
@permission_required('planEstudio.change_carreraestudiante')
@permission_required('planEstudio.change_asignaturavencida')
def expediente_guardar_edicion(request, pk):
    carreraestudiante = get_object_or_404(CarreraEstudiante, pk=pk)
    estudiante = get_object_or_404(Estudiante,
                                   pk=carreraestudiante.estudianteId_id)  # válido cuando sea una sola carrera
    estudiante.carneIdentidad = request.session['carne']
    estudiante.nombre = request.session['nombre']
    estudiante.apellidos = request.session['apellidos']
    estudiante.direccion = request.session['direccion']
    estudiante.ubicacionId_id = request.session['ubicacion']
    estudiante.nacionalidadId_id = request.session['nacionalidad']
    estudiante.sexoId_id = request.session['sexo']
    estudiante.etniaId_id = request.session['etnia']
    estudiante.correoElectronico = request.session['correo']
    estudiante.fechaIngESup = request.session['fechaIngESup']
    num1 = request.session['indice'][0]
    try:
        num2 = request.session['indice'][2]
    except:
        num2 = '0'
    try:
        num3 = request.session['indice'][3]
    except:
        num3 = '0'
    q1 = num1 + '.' + num2 + num3
    indice_float = float(q1)  # convirtiendo a decimal
    estudiante.indiceAcademico = indice_float
    estudiante.save()
    log_editar1(estudiante, request)

    coho = request.session['cohorte']
    coho = int(coho)

    if not carreraestudiante.cohorteId_id == coho:
        carreraestudiante.cohorteId_id = coho
        carreraestudiante.save()
        log_editar1(carreraestudiante, request)

    vencidas_ = AsignaturaVencida.objects.filter(carreraEstudianteId=carreraestudiante, activo=True)
    vencidas_origen = []  # Primero las deshabilito todas....
    for a in vencidas_:
        a.activo = False
        a.save()
    vencidas_eliminadas = AsignaturaVencida.objects.filter(carreraEstudianteId=carreraestudiante, activo=False)
    vencidas_eliminadas_list = []  # ahora, me llevo todas las eliminadas...
    for a in vencidas_eliminadas:
        vencidas_eliminadas_list.append(a.asignaturaCohorteId)

    vencidas = request.session['listAsigCohorte']
    asignaturas_vencidas_asistente = vencidas.split('-')
    for a in asignaturas_vencidas_asistente:  # recorro las que me envía el asistente
        try:
            asigcoho = get_object_or_404(AsignaturaCohorte, pk=a)
            if vencidas_eliminadas_list.__contains__(asigcoho):  # si ya lo contiene lo marco como activo
                item = get_object_or_404(AsignaturaVencida, carreraEstudianteId=carreraestudiante,
                                         asignaturaCohorteId=asigcoho)
                # item = vencidas_eliminadas_list.__getitem__(asigcoho)
                item.activo = True
                item.save()
                log_editar1(item, request)
            elif not vencidas_origen.__contains__(asigcoho):  # si no la contiene entonces salvo
                av = AsignaturaVencida(carreraEstudianteId=carreraestudiante, asignaturaCohorteId=asigcoho)
                av.save()  # como es nueva la salvo...
                log_nuevo1(av, request)
        except:
            pass
    eliminar_variables_sesion(request)
    return HttpResponseRedirect(reverse('persona:estudiante_listar'))


@class_view_decorator(login_required)
@class_view_decorator(permission_required('persona.view_estudiante'))
class EstudianteDetailView(DetailView):
    model = Estudiante
    slug_field = 'pk'
    # fields = ['name']
    template_name = "estudiante_detalle.html"

    def get_context_data(self, **kwargs):
        ctx = super(EstudianteDetailView, self).get_context_data(**kwargs)
        estudiante = self.get_object()
        carrest = CarreraEstudiante.objects.filter(estudianteId=estudiante.pk)
        bla = AjusteEstudiante.objects.filter(activo=True, carreraEstudianteId=carrest)  # todos los ajustes
        datos = AprobacionDeAjuste.objects.filter(ajusteEstudianteId=bla, estadoId_id=11, activo=True)  # los aprobados
        ctx['object_list'] = datos
        asigvenc = AsignaturaVencida.objects.filter(carreraEstudianteId=carrest, activo=True)
        ctx['asigvenc'] = asigvenc
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturavencida')
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('persona.delete_estudiante'))
class EstudianteDelete(DeleteView, DeletionMixin):
    model = Estudiante
    queryset = Estudiante.objects.filter(activo=True)
    template_name = "estudiante_eliminar.html"
    success_url = reverse_lazy('persona:estudiante_listar')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.activo = False
        self.object.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('persona:estudiante_listar'))