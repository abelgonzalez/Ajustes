__author__ = 'Abel'
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_editar, log_eliminar
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView, DeletionMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy
from planEstudio.models import PlanEstudio, Cohorte
from planEstudio.forms import PlanEstudioForm


class PlanEstudioListView(PaginationMixin, ListView):
    paginate_by = 10
    model = PlanEstudio
    queryset = PlanEstudio.objects.filter(
        activo=True)  # si lo comentas y  trabajas con el método de abajo, puedes manipular los planes hechos por el usuario que inició sesión
    template_name = "planestudio_listar.html"

    # def get_queryset(self):
    # return consulta(self, PlanEstudio, False)

    def get_context_data(self, **kwargs):
        ctx = super(PlanEstudioListView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'planEstudio', 'planestudio')
        return ctx


class PlanEstudioBuscarListView(PaginationMixin, ListView):
    paginate_by = 1000
    model = PlanEstudio
    template_name = "planestudio_busqueda.html"

    def get_context_data(self, **kwargs):
        ctx = super(PlanEstudioBuscarListView, self).get_context_data(**kwargs)
        ctx['criterio'] = self.request.REQUEST.get("q")
        ctx = visibilidad(self, ctx, 'planEstudio', 'planestudio')
        return ctx

    # def get_queryset(self):
    # return consulta(self, PlanEstudio)

    def get_queryset(self):
        atributos = ['nombre', 'cantidadPeriodos', 'comentarios']
        object_list = busqueda(self, atributos, PlanEstudio)
        return object_list


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.add_planestudio'))
class PlanEstudioCreate(CreateView):
    model = PlanEstudio
    form_class = PlanEstudioForm
    template_name = "planestudio_nuevo.html"
    success_url = reverse_lazy('planEstudio:plan_estudio_listar')

    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        self.object = PlanEstudio.objects.filter(activo=True).last()
        log_nuevo(self, form)
        return super(PlanEstudioCreate, self).form_valid(form)

    #def get_success_url(self):
    #    pk = self.object.pk
    #    return reverse_lazy('planEstudio:cohorte_detalle',
    #                        kwargs={'pk': pk})  # así regreso al cohorte y veo sus detalles :P


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.change_planestudio'))
class PlanEstudioUpdate(UpdateView):
    model = PlanEstudio
    form_class = PlanEstudioForm
    # fields = ['nombre']
    template_name = "planestudio_editar.html"
    success_url = reverse_lazy('planEstudio:plan_estudio_listar')
    # template_name_suffix = '_update_form'

    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseForbidden()
        log_editar(self, request, *args, **kwargs)
        return super(PlanEstudioUpdate, self).post(request, *args, **kwargs)


class PlanEstudioDetailView(DetailView):
    model = PlanEstudio
    slug_field = 'pk'
    # fields = ['name']
    template_name = "planestudio_detalle.html"


    def get_context_data(self, **kwargs):
        ctx = super(PlanEstudioDetailView, self).get_context_data(**kwargs)
        plan = self.get_object()
        ctx = visibilidad(self, ctx, 'planEstudio', 'cohorte')
        cohortes = Cohorte.objects.filter(planEstudioId=plan.pk)
        ctx['object_list'] = cohortes
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.delete_planestudio'))
class PlanEstudioDelete(DeleteView, DeletionMixin):
    model = PlanEstudio
    queryset = PlanEstudio.objects.filter(activo=True)
    template_name = "planestudio_eliminar.html"
    success_url = reverse_lazy('planEstudio:plan_estudio_listar')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.activo = False
        self.object.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('planEstudio:plan_estudio_listar'))
