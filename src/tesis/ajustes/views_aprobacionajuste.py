__author__ = 'Abel'
from pure_pagination.mixins import PaginationMixin
from tesis.metodos import class_view_decorator, visibilidad, busqueda, log_nuevo, log_editar, log_eliminar
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView, DeleteView, CreateView, DeletionMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.decorators import login_required, permission_required
from django.http import HttpResponseForbidden, HttpResponseRedirect
from django.core.urlresolvers import reverse_lazy
from django.db.models import Q
from ajustes.models import AjusteEstudiante, AprobacionDeAjuste
from ajustes.forms import AjusteEstudianteForm
from tesis.metodos import expedientes_aprobados_secretaria, expedientes_aprobados_coordinador, \
    expedientes_pendientes_secretaria, expedientes_pendientes_coordinador, expedientes_devueltos_secretaria, \
    expedientes_devueltos_coordinador, ajustes_aprobados_coordinador, ajustes_aprobados_decano, \
    ajustes_pendientes_secretaria, ajustes_pendientes_coordinador, ajustes_pendientes_decano, \
    ajustes_devueltos_coordinador, ajustes_devueltos_decano

# los de expediente

@class_view_decorator(login_required)
class AprobacionExpedienteAprobadoListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_aprobados.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionExpedienteAprobadoListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = False
        ctx['expedientes_list'] = True

        if self.request.session["secretaria"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = expedientes_aprobados_secretaria(self.request)

        if self.request.session["coordinador"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_aprobados_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_aprobados_coordinador(self.request)
            ctx['secretaria_list'] = expedientes_aprobados_secretaria(self.request)

        return ctx

@class_view_decorator(login_required)

class AprobacionExpedientePendienteListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_pendientes.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionExpedientePendienteListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = False
        ctx['expedientes_list'] = True
        if self.request.session["secretaria"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = expedientes_pendientes_secretaria(self.request)

        if self.request.session["coordinador"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_pendientes_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_pendientes_coordinador(self.request)
            ctx['secretaria_list'] = expedientes_pendientes_secretaria(self.request)

        return ctx

@class_view_decorator(login_required)

class AprobacionExpedienteDevueltoListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_devueltos.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionExpedienteDevueltoListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = False
        ctx['expedientes_list'] = True
        if self.request.session["secretaria"] == True:
            ctx['datos_devueltos'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = expedientes_devueltos_secretaria(self.request)

        if self.request.session["coordinador"] == True:
            ctx['datos_devueltos'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_devueltos_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_devueltos'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = expedientes_devueltos_coordinador(self.request)
            ctx['secretaria_list'] = expedientes_devueltos_secretaria(self.request)

        return ctx


# los de ajuste
@class_view_decorator(login_required)
class AprobacionAjusteAprobadoListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_aprobados.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionAjusteAprobadoListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = True
        ctx['expedientes_list'] = False
        if self.request.session["secretaria"] == True:
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["coordinador"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = ajustes_aprobados_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = ajustes_aprobados_decano(self.request)
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_aprobados'] = True
            ctx['decano_list'] = ajustes_aprobados_decano(self.request)
            ctx['coordinador_list'] = ajustes_aprobados_coordinador(self.request)
            ctx['secretaria_list'] = False

        return ctx

@class_view_decorator(login_required)
class AprobacionAjustePendienteListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_pendientes.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionAjustePendienteListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = True
        ctx['expedientes_list'] = False

        if self.request.session["secretaria"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = ajustes_pendientes_secretaria(self.request)

        if self.request.session["coordinador"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = ajustes_pendientes_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = ajustes_pendientes_decano(self.request)
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_pendientes'] = True
            ctx['decano_list'] = ajustes_pendientes_decano(self.request)
            ctx['coordinador_list'] = ajustes_pendientes_coordinador(self.request)
            ctx['secretaria_list'] = ajustes_pendientes_secretaria(self.request)

        return ctx

@class_view_decorator(login_required)
class AprobacionAjusteDevueltoListView(PaginationMixin, ListView):
    model = AprobacionDeAjuste
    queryset = AprobacionDeAjuste.objects.filter(activo=True)
    template_name = "aprobacionajuste_listar_devueltos.html"

    def get_context_data(self, **kwargs):
        ctx = super(AprobacionAjusteDevueltoListView, self).get_context_data(**kwargs)
        ctx['ajustes_list'] = True
        ctx['expedientes_list'] = False
        if self.request.session["secretaria"] == True:
            ctx['decano_list'] = False
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["coordinador"] == True:
            ctx['datos_devueltos'] = True
            ctx['decano_list'] = False
            ctx['coordinador_list'] = ajustes_devueltos_coordinador(self.request)
            ctx['secretaria_list'] = False

        if self.request.session["decano"] == True:
            ctx['decano_list'] = ajustes_devueltos_decano(self.request)
            ctx['coordinador_list'] = False
            ctx['secretaria_list'] = False

        if self.request.session["administrador"] == True:
            ctx['datos_devueltos'] = True
            ctx['decano_list'] = ajustes_devueltos_decano(self.request)
            ctx['coordinador_list'] = ajustes_devueltos_coordinador(self.request)
            ctx['secretaria_list'] = False

        return ctx

@class_view_decorator(login_required)
class AjusteEstudianteProgresoListView(DetailView):
    model = AprobacionDeAjuste
    slug_field = 'pk'
    template_name = "aprobacionajuste_progreso.html"

    def get_context_data(self, **kwargs):
        ctx = super(AjusteEstudianteProgresoListView, self).get_context_data(**kwargs)
        plan = self.get_object()
        cohortes = AprobacionDeAjuste.objects.filter(ajusteEstudianteId=plan.pk)

        ctx['object_list'] = cohortes
        return ctx