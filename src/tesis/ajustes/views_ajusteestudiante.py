__author__ = 'Abel'
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_editar, log_eliminar
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView, DeletionMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import render, render_to_response, get_object_or_404
from ajustes.forms import AjusteEstudianteForm
from planEstudio.models import CarreraEstudiante, AsignaturaVencida, AsignaturaCohorte
from planEstudio.metodos import obtener_asignatura_optativa_electiva, obtener_asignatura_cohorte, \
    obtener_asignatura_vencida_cohorte, obtener_todas_universidades_, obtener_asignaturas_cohorte
from ajustes.models import AjusteEstudiante, AprobacionDeAjuste, AjusteAsignatura, AjusteAsignaturaConvalidada
from tesis.metodos import ajustes_pendientes_coordinador
from planEstudio.models import Cohorte
from ajustes.nomencladores.nomencladorAjuste import MotivoAjuste, DocumentacionAnalizada, Situacion, EstadoAjuste
from planEstudio.nomencladores.nomencladorPlanEstudio import AnhoSemestre, Curso
from ajustes.metodos import eliminar_variables_sesion


@class_view_decorator(login_required)
@class_view_decorator(permission_required('ajustes.view_ajusteestudiante'))
class AjusteEstudianteListView(PaginationMixin, ListView):
    paginate_by = 10
    model = AjusteEstudiante
    queryset = AjusteEstudiante.objects.filter(activo=True)
    template_name = "ajusteestudiante_listar.html"

    def get_context_data(self, **kwargs):
        ctx = super(AjusteEstudianteListView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'ajustes', 'ajusteestudiante')
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('ajustes.view_ajusteestudiante'))
class AjusteEstudianteBuscarListView(PaginationMixin, ListView):
    paginate_by = 1000
    model = AjusteEstudiante
    template_name = "ajusteestudiante_busqueda.html"

    def get_context_data(self, **kwargs):
        ctx = super(AjusteEstudianteBuscarListView, self).get_context_data(**kwargs)
        ctx['criterio'] = self.request.REQUEST.get("q")
        ctx = visibilidad(self, ctx, 'ajustes', 'ajusteestudiante')
        return ctx

    def get_queryset(self):
        atributos = ['carreraEstudianteId', 'motivoAjusteId', 'documentacionAnalizadaId', 'cursoAjusteId',
                     'cohortePropuestoId', 'cohortePropuestoId', 'anhoSemestreAjustadoId']
        object_list = busqueda(self, atributos, AjusteEstudiante)
        return object_list


@class_view_decorator(login_required)
@class_view_decorator(permission_required('ajustes.add_ajusteestudiante'))
class AjusteEstudianteCreate(CreateView):
    model = AjusteEstudiante
    form_class = AjusteEstudianteForm
    # group_required = [u"Jefe de Departamento"]
    # fields = ['nombre', 'cantidadPeriodos', 'comentarios']
    template_name = "ajusteestudiante_nuevo.html"
    # success_url = reverse_lazy('ajuste:ajusteestudiante_listar')

    def form_valid(self, form):
        form.instance.user = self.request.user
        # form.instance.post_date = datetime.now()
        form.save()
        log_nuevo(self, form)
        return super(AjusteEstudianteCreate, self).form_valid(form)

    def get_context_data(self, **kwargs):
        ctx = super(AjusteEstudianteCreate, self).get_context_data(**kwargs)
        # ctx['universidad1'] = obtener_todas_universidades_()
        return ctx

    def get_success_url(self):
        ajusteestudiante = self.object.pk
        return reverse_lazy('persona:ajusteestudiante_nuevo_asistente',
                            kwargs={'pk': ajusteestudiante})  # así regreso al asistente para seguir :P


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def ajusteestudiante_nuevo(request):
    eliminar_variables_sesion(request)
    pendientes_coord = ajustes_pendientes_coordinador(request)
    hay_ajustes = False
    coordinador_list = []
    for a in pendientes_coord:
        if a.estadoId_id == 3:
            hay_ajustes = True
            coordinador_list.append(a)
    args = {'coordinador_list': coordinador_list, 'hay_ajustes': hay_ajustes}
    return render(request, 'ajusteestudiante_nuevo_tab.html', args)


@login_required()
@permission_required('ajustes.add_ajusteestudiante')
def ajusteestudiante_nuevo_asistente(request, pk):
    eliminar_variables_sesion(request)
    carreraestudiante = get_object_or_404(CarreraEstudiante, pk=pk)
    motivo = MotivoAjuste.objects.filter(activo=True)
    documentacionAnalizada = DocumentacionAnalizada.objects.filter(activo=True)
    cursoAjuste = Curso.objects.filter(activo=True)
    universidad1 = obtener_todas_universidades_()
    args = {'carreraestudiante': carreraestudiante, 'motivo': motivo, 'documentacionAnalizada': documentacionAnalizada,
            'cursoAjuste': cursoAjuste, 'universidad1': universidad1}
    return render(request, 'ajusteestudiante_nuevo.html', args)


@login_required()
@permission_required('ajustes.change_ajusteestudiante')
def ajusteestudiante_editar_asistente(request, pk):
    ajuste_est = get_object_or_404(AjusteEstudiante, pk=pk)
    carreraestudiante = get_object_or_404(CarreraEstudiante, pk=ajuste_est.carreraEstudianteId_id)
    motivo = MotivoAjuste.objects.filter(activo=True)
    motivo_selected = get_object_or_404(MotivoAjuste, pk=ajuste_est.motivoAjusteId_id)
    documentacionAnalizada = DocumentacionAnalizada.objects.filter(activo=True)
    documentacionAnalizada_selected = get_object_or_404(DocumentacionAnalizada,
                                                        pk=ajuste_est.documentacionAnalizadaId_id)
    cursoAjuste = Curso.objects.filter(activo=True)
    cursoAjuste_selected = get_object_or_404(Curso, pk=ajuste_est.cursoAjusteId_id)
    universidad1 = obtener_todas_universidades_()
    cohorte = get_object_or_404(Cohorte, pk=ajuste_est.cohortePropuestoId_id)
    univ = cohorte.carreraTipoCursoId.universidadId.pk
    fac = cohorte.carreraTipoCursoId.facultadId.pk
    carr = cohorte.carreraTipoCursoId.carreraId.pk
    tipocurso = cohorte.carreraTipoCursoId.tipoCursoId.pk
    plan = cohorte.planEstudioId.pk
    curso = cohorte.cursoId.pk
    request.session['ajusteestudiante'] = ajuste_est.pk

    args = {'carreraestudiante': carreraestudiante, 'motivo': motivo, 'motivo_selected': motivo_selected,
            'documentacionAnalizada': documentacionAnalizada,
            'documentacionAnalizada_selected': documentacionAnalizada_selected, 'cursoAjuste': cursoAjuste,
            'cursoAjuste_selected': cursoAjuste_selected, 'universidad1': universidad1, 'cohorte_selected': cohorte,
            'univ_selected': univ, 'fac_selected': fac, 'carr_selected': carr, 'tipocurso_selected': tipocurso,
            'plan_selected': plan, 'curso_selected': curso}
    return render(request, 'ajusteestudiante_editar.html', args)


@class_view_decorator(login_required)
@class_view_decorator(permission_required('ajustes.view_ajusteestudiante'))
class AjusteEstudianteDetailView(DetailView):
    model = AjusteEstudiante
    slug_field = 'pk'
    # fields = ['name']
    template_name = "ajusteestudiante_detalle.html"

    def get_context_data(self, **kwargs):
        ctx = super(AjusteEstudianteDetailView, self).get_context_data(**kwargs)
        ajusteEstudiante = self.get_object()
        ctx['estudiante'] = ajusteEstudiante.carreraEstudianteId.estudianteId

        cohorteId = ajusteEstudiante.cohortePropuestoId_id
        ajusteAsig = obtener_asignatura_cohorte(cohorteId)
        listAsigCohorte = []
        for a in ajusteAsig:
            listAsigCohorte.append(a)
        ctx['lista_cp'] = listAsigCohorte
        ctx['asig_opt_elec2'] = obtener_asignatura_optativa_electiva()
        ctx['cohorteprev'] = ajusteEstudiante.cohortePropuestoId
        ctx['cohorteact'] = ajusteEstudiante.carreraEstudianteId.cohorteId
        # ordenar por anho semestre primero.....
        vaa = ajusteEstudiante.carreraEstudianteId.cohorteId
        asigVencidas = obtener_asignatura_vencida_cohorte(vaa)
        listAsigVencidas = []
        for a in asigVencidas:
            listAsigVencidas.append(a)
        ctx['lista_ca'] = listAsigVencidas
        ctx['asig_opt_elec1'] = obtener_asignatura_optativa_electiva()
        ctx['listaAsigAjustadas'] = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True)
        ajustadas = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True)
        listaAsigConvalidadas = []

        ajusteAsigna = AjusteAsignatura.objects.filter(ajusteEstudianteId=ajusteEstudiante, situacionId_id=3,
                                                       activo=True)

        for a in ajusteAsigna:  # este método puede ser la solucion para el multiple...
            conva = AjusteAsignaturaConvalidada.objects.filter(ajusteAsignaturaId=a)
            for b in conva:
                listaAsigConvalidadas.append(b)

        ctx['listaAsigConvalidadas'] = listaAsigConvalidadas  # AjusteAsignaturaConvalidada.objects.filter(activo=True)
        ctx['progreso'] = AprobacionDeAjuste.objects.filter(ajusteEstudianteId=ajusteEstudiante, activo=True).last()

        vencida_marca = AsignaturaVencida.objects.filter(carreraEstudianteId=ajusteEstudiante.carreraEstudianteId,
                                                         activo=True)
        list_vencidas_marca = []
        for a in vencida_marca:
            list_vencidas_marca.append(a)

        ctx['list_vencidas_marca'] = list_vencidas_marca

        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('ajustes.delete_ajusteestudiante'))
class AjusteEstudianteDelete(DeleteView, DeletionMixin):
    model = AjusteEstudiante
    queryset = AjusteEstudiante.objects.filter(activo=True)
    template_name = "ajusteestudiante_eliminar.html"
    success_url = reverse_lazy('ajustes:ajusteestudiante_listar')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.activo = False
        self.object.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('ajustes:ajusteestudiante_listar'))