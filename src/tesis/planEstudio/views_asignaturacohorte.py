__author__ = 'Abel'
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_editar, log_eliminar
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView, DeletionMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy
from django.shortcuts import get_object_or_404
from planEstudio.models import AsignaturaCohorte, AsignaturaOptativaElectiva, PlanEstudio, Cohorte
from planEstudio.forms import AsignaturaCohorteForm, AsignaturaCohorteUpdateForm


class AsignaturaCohorteListView(PaginationMixin, ListView):
    paginate_by = 10
    model = AsignaturaCohorte
    queryset = AsignaturaCohorte.objects.filter(activo=True)
    template_name = "asignaturacohorte_listar.html"

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteListView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturacohorte')
        return ctx


class AsignaturaCohorteBuscarListView(PaginationMixin, ListView):
    paginate_by = 1000
    model = AsignaturaCohorte
    template_name = "asignaturacohorte_busqueda.html"

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteBuscarListView, self).get_context_data(**kwargs)
        ctx['criterio'] = self.request.REQUEST.get("q")
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturacohorte')
        return ctx

    def get_queryset(self):
        atributos = ['asignaturaId', 'cohorteId']
        object_list = busqueda(self, atributos, AsignaturaCohorte)
        return object_list


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.add_cohorte'))
class AsignaturaCohorteCreate(CreateView):
    model = AsignaturaCohorte
    form_class = AsignaturaCohorteForm
    # group_required = [u"Jefe de Departamento"]
    # fields = ['nombre', 'cantidadPeriodos', 'comentarios']
    template_name = "asignaturacohorte_nuevo.html"
    # success_url = reverse_lazy('planEstudio:asignaturacohorte_listar')

    def get_initial(self):
        return {'cohorteId': self.kwargs['pk']}  # pasándole el cohorte de origen

    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        self.object = AsignaturaCohorte.objects.filter(activo=True).last()
        log_nuevo(self, form)
        return super(AsignaturaCohorteCreate, self).form_valid(form)

    def get_success_url(self):
        return reverse_lazy('planEstudio:cohorte_detalle',
                            kwargs={'pk': self.kwargs['pk']})  # así regreso al cohorte :P

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteCreate, self).get_context_data(**kwargs)
        coho = get_object_or_404(Cohorte, pk=self.kwargs['pk'])
        ctx['cohorteId'] = coho
        ctx['planId'] = coho.planEstudioId
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.change_cohorte'))
class AsignaturaCohorteUpdate(UpdateView):
    model = AsignaturaCohorte
    form_class = AsignaturaCohorteUpdateForm
    # fields = ['nombre']
    template_name = "asignaturacohorte_editar.html"
    # success_url = reverse_lazy('planEstudio:asignaturacohorte_listar')
    # template_name_suffix = '_update_form'

    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseForbidden()
        log_editar(self, request, *args, **kwargs)
        return super(AsignaturaCohorteUpdate, self).post(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteUpdate, self).get_context_data(**kwargs)
        a = self.get_object()
        ctx['planId'] = a.cohorteId.planEstudioId
        ctx['cohorteId'] = a.cohorteId
        return ctx

    def get_success_url(self):
        cohort = AsignaturaCohorte.objects.filter(cohorteId=self.get_object().cohorteId_id,
                                                  activo=True).first().cohorteId_id
        return reverse_lazy('planEstudio:cohorte_detalle',
                            kwargs={'pk': cohort})  # así regreso al cohorte :P


class AsignaturaCohorteDetailView(DetailView):
    model = AsignaturaCohorte
    slug_field = 'pk'
    # fields = ['name']
    template_name = "asignaturacohorte_detalle.html"

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteDetailView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturaoptativaelectiva')
        a = self.get_object()
        if a.curriculoId_id == 3:
            ctx['optativa_electiva'] = True
            object_list = AsignaturaOptativaElectiva.objects.filter(asignaturaCohorteId=self.object, activo=True)
            ctx['object_list'] = object_list
        ctx['planId'] = a.cohorteId.planEstudioId
        ctx['cohorteId'] = a.cohorteId
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.delete_cohorte'))
class AsignaturaCohorteDelete(DeleteView, DeletionMixin):
    model = AsignaturaCohorte
    queryset = AsignaturaCohorte.objects.filter(activo=True)
    template_name = "asignaturacohorte_eliminar.html"
    # success_url = reverse_lazy('planEstudio:asignaturacohorte_listar')

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaCohorteDelete, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturaoptativaelectiva')
        a = self.get_object()
        ctx['planId'] = a.cohorteId.planEstudioId
        ctx['cohorteId'] = a.cohorteId
        return ctx

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.activo = False
        cohort = AsignaturaCohorte.objects.filter(cohorteId=self.get_object().cohorteId_id,
                                                  activo=True).first().cohorteId_id
        self.object.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('planEstudio:cohorte_detalle',
                                                 kwargs={'pk': cohort}))  # así regreso al cohorte :P