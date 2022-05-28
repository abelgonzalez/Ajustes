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
from planEstudio.models import AsignaturaCohorte, AsignaturaOptativaElectiva
from planEstudio.forms import AsignaturaOptativaElectivaForm, AsignaturaOptativaElectivaUpdateForm


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.add_asignaturaoptativaelectiva'))
class AsignaturaOptativaElectivaCreate(CreateView):
    model = AsignaturaOptativaElectiva
    form_class = AsignaturaOptativaElectivaForm
    # group_required = [u"Jefe de Departamento"]
    # fields = ['nombre', 'cantidadPeriodos', 'comentarios']
    template_name = "asignaturaoptativaelectiva_nuevo.html"
    # success_url = reverse_lazy('planEstudio:asignaturacohorte_listar')

    def get_initial(self):
        aa = self.kwargs['pk']
        return {'asignaturacohorteId': self.kwargs['pk']}  # pasándole la asignatura cohorte de origen

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaOptativaElectivaCreate, self).get_context_data(**kwargs)
        a = get_object_or_404(AsignaturaCohorte, pk=self.kwargs['pk'])
        ctx['planId'] = a.cohorteId.planEstudioId
        ctx['cohorteId'] = a.cohorteId
        ctx['asignaturaCohorteId'] = a
        return ctx

    def get_form_kwargs(self, **kwargs):
        kwargs = super(AsignaturaOptativaElectivaCreate, self).get_form_kwargs(**kwargs)
        kwargs.update({'current_user': self.request.user})
        return kwargs

    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        self.object = AsignaturaOptativaElectiva.objects.filter(activo=True).last()
        log_nuevo(self, form)
        return super(AsignaturaOptativaElectivaCreate, self).form_valid(form)

    def get_success_url(self):
        aaa = self.kwargs['pk']
        return reverse_lazy('planEstudio:asignaturacohorte_detalle',
                            kwargs={'pk': self.kwargs['pk']})  # así regreso a la asign cohorte :P


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.change_asignaturaoptativaelectiva'))
class AsignaturaOptativaElectivaUpdate(UpdateView):
    model = AsignaturaOptativaElectiva
    form_class = AsignaturaOptativaElectivaUpdateForm
    # fields = ['nombre']
    template_name = "asignaturaoptativaelectiva_editar.html"

    def get_initial(self):
        aa = self.kwargs['pk']
        return {'asignaturacohorteId': self.kwargs['pk']}  # pasándole la asignatura cohorte de origen

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaOptativaElectivaUpdate, self).get_context_data(**kwargs)
        a = self.get_object()
        ctx['planId'] = a.asignaturaCohorteId.cohorteId.planEstudioId
        ctx['cohorteId'] = a.asignaturaCohorteId.cohorteId
        ctx['asignaturaCohorteId'] = a.asignaturaCohorteId
        return ctx

    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseForbidden()
        log_editar(self, request, *args, **kwargs)
        return super(AsignaturaOptativaElectivaUpdate, self).post(request, *args, **kwargs)

    def get_form_kwargs(self, **kwargs):
        kwargs = super(AsignaturaOptativaElectivaUpdate, self).get_form_kwargs(**kwargs)
        kwargs.update({'current_user': self.request.user})
        return kwargs

    def get_success_url(self):
        a2 = self.get_object().asignaturaCohorteId.pk
        asignaturacohorte = get_object_or_404(AsignaturaCohorte, pk=a2, activo=True).pk
        return reverse_lazy('planEstudio:asignaturacohorte_detalle',
                            kwargs={'pk': asignaturacohorte})  # así regreso a la asignatura-cohorte :P



class AsignaturaOptativaElectivaDetailView(DetailView):
    model = AsignaturaOptativaElectiva
    slug_field = 'pk'
    # fields = ['name']
    template_name = "asignaturaoptativaelectiva_detalle.html"

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaOptativaElectivaDetailView, self).get_context_data(**kwargs)
        object_list = AsignaturaOptativaElectiva.objects.filter(asignaturaCohorteId=self.object, activo=True)
        ctx['object_list'] = object_list
        a = self.get_object()
        ctx['planId'] = a.asignaturaCohorteId.cohorteId.planEstudioId
        ctx['cohorteId'] = a.asignaturaCohorteId.cohorteId
        ctx['asignaturaCohorteId'] = a.asignaturaCohorteId
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.delete_asignaturaoptativaelectiva'))
class AsignaturaOptativaElectivaDelete(DeleteView, DeletionMixin):
    model = AsignaturaOptativaElectiva
    queryset = AsignaturaOptativaElectiva.objects.filter(activo=True)
    template_name = "asignaturaoptativaelectiva_eliminar.html"
    # success_url = reverse_lazy('planEstudio:asignaturacohorte_listar')

    def get_context_data(self, **kwargs):
        ctx = super(AsignaturaOptativaElectivaDelete, self).get_context_data(**kwargs)
        object_list = AsignaturaOptativaElectiva.objects.filter(asignaturaCohorteId=self.object, activo=True)
        ctx['object_list'] = object_list
        a = self.get_object()
        ctx['planId'] = a.asignaturaCohorteId.cohorteId.planEstudioId
        ctx['cohorteId'] = a.asignaturaCohorteId.cohorteId
        ctx['asignaturaCohorteId'] = a.asignaturaCohorteId
        return ctx

    def delete(self, request, *args, **kwargs):
        aa = self.get_object()
        self.object = self.get_object()
        asignoptelect = self.get_object().asignaturaCohorteId_id
        asignatura = get_object_or_404(AsignaturaOptativaElectiva, pk=aa.pk)
        asignatura.activo = False
        asignatura.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('planEstudio:asignaturacohorte_detalle',
                                                 kwargs={'pk': asignoptelect}))  # así regreso a la asignaturacohorte :P