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
from planEstudio.metodos import obtener_asignatura_cohorte, obtener_asignatura_optativa_electiva_asignatura, \
    obtener_asignatura_optativa_electiva
from planEstudio.models import Cohorte, AsignaturaCohorte, AsignaturaOptativaElectiva
from planEstudio.forms import CohorteForm, CohorteDuplicarForm, PlanEstudio, CohorteUpdateForm
from planEstudio.metodos import obtener_todas_universidades_


class CohorteListView(PaginationMixin, ListView):
    paginate_by = 10
    model = Cohorte
    queryset = Cohorte.objects.filter(activo=True)
    template_name = "cohorte_listar.html"

    def get_context_data(self, **kwargs):
        ctx = super(CohorteListView, self).get_context_data(**kwargs)
        ctx = visibilidad(self, ctx, 'planEstudio', 'cohorte')
        return ctx


class CohorteBuscarListView(PaginationMixin, ListView):
    paginate_by = 1000
    model = Cohorte
    template_name = "cohorte_busqueda.html"

    def get_context_data(self, **kwargs):
        ctx = super(CohorteBuscarListView, self).get_context_data(**kwargs)
        ctx['criterio'] = self.request.REQUEST.get("q")
        ctx = visibilidad(self, ctx, 'planEstudio', 'cohorte')
        return ctx

    def get_queryset(self):
        atributos = ['carreraTipoCursoId', 'planEstudioId', 'cursoId', 'comentario']
        object_list = busqueda(self, atributos, Cohorte)
        return object_list


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.add_cohorte'))
class CohorteCreate(CreateView):
    model = Cohorte
    form_class = CohorteForm
    # group_required = [u"Jefe de Departamento"]
    # fields = ['nombre', 'cantidadPeriodos', 'comentarios']
    template_name = "cohorte_nuevo.html"
    # success_url = reverse_lazy('planEstudio:cohorte_listar')

    def get_initial(self):  # acá se le pasa el plan de estudio de origen.
        try:
            a = self.kwargs['pk']
            return {'planId': self.kwargs['pk']}  # pasándole el plan de estudios de origen
        except:
            pass

    def get_form_kwargs(self, **kwargs):
        kwargs = super(CohorteCreate, self).get_form_kwargs(**kwargs)
        kwargs.update({'current_user': self.request.user})
        return kwargs

    def get_context_data(self, **kwargs):
        ctx = super(CohorteCreate, self).get_context_data(**kwargs)
        plan = get_object_or_404(PlanEstudio, pk=self.kwargs['pk'])
        ctx['plan'] = plan
        return ctx

    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        self.object = Cohorte.objects.filter(activo=True).last()
        log_nuevo(self, form)
        return super(CohorteCreate, self).form_valid(form)

    def get_success_url(self):
        pk = self.object.pk
        return reverse_lazy('planEstudio:cohorte_detalle',
                            kwargs={'pk': pk})  # así regreso al cohorte y veo sus detalles :P


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.add_cohorte'))
class CohorteDuplicarCreate(CreateView):
    model = Cohorte
    form_class = CohorteDuplicarForm
    # group_required = [u"Jefe de Departamento"]
    # fields = ['nombre', 'cantidadPeriodos', 'comentarios']
    template_name = "cohorte_nuevo.html"
    # success_url = reverse_lazy('planEstudio:cohorte_listar')

    def get_initial(self):  # acá se le pasa el cohorte de origen..... para duplicar
        try:
            a = self.kwargs['pk']
            return {'cohorteId': self.kwargs['pk']}  # pasándole el cohorte de origen
        except:
            pass

    def get_context_data(self, **kwargs):
        ctx = super(CohorteDuplicarCreate, self).get_context_data(**kwargs)
        plan = get_object_or_404(PlanEstudio, pk=self.kwargs['pk'])
        ctx['plan'] = plan
        ctx['cohorteId'] = get_object_or_404(Cohorte, pk=self.kwargs['pk'])
        ctx['duplicar'] = True
        return ctx

    def form_valid(self, form):
        try:
            cohorteId = self.kwargs['pk']  # pasándole el cohorte de origen
            # bueno, acá está el pollo del arroz con pollo (TOY DURO :P)
            form.instance.user = self.request.user
            # form.instance.post_date = datetime.now()
            form.save()
            cohort_nuevo = form.instance
            # ahora bien, después que all esté fresa, guardas el formulario
            form.instance.user = self.request.user
            ajusteAsig = obtener_asignatura_cohorte(cohorteId)  # el cohorte de origen
            for a in ajusteAsig:
                asCoho = AsignaturaCohorte(asignaturaId=a.asignaturaId, cohorteId=cohort_nuevo,
                                           anhoSemestreId=a.anhoSemestreId, cantidadHorasS=a.cantidadHorasS,
                                           cantidadHorasT=a.cantidadHorasT, tipoAsignaturaId=a.tipoAsignaturaId,
                                           disciplinaId=a.disciplinaId, curriculoId=a.curriculoId,
                                           tipoEvauacionId=a.tipoEvauacionId, comentario=a.comentario, activo=a.activo)
                asCoho.save()  # guardando las asignaturas en el cohorte nuevo
                try:
                    optaelect = obtener_asignatura_optativa_electiva_asignatura(a)
                    for b in optaelect:
                        optativaelec = AsignaturaOptativaElectiva(asignaturaId=b.asignaturaId,
                                                                  asignaturaCohorteId=asCoho)  # this is spartaaaa!!!!
                        optativaelec.save()  # guardando las optativas o electivas
                except:
                    pass  # weno... pa x si esta asign no tiene optat/elect

            return super(CohorteDuplicarCreate, self).form_valid(form)
        except:
            form.instance.user = self.request.user
            form.save()
            self.object = Cohorte.objects.filter(activo=True).last()
            log_nuevo(self, form)
            return super(CohorteDuplicarCreate, self).form_valid(form)

    def get_success_url(self):
        pk = self.object.pk
        return reverse_lazy('planEstudio:cohorte_detalle',
                            kwargs={'pk': pk})  # así regreso al cohorte y veo sus detalles :P


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.change_cohorte'))
class CohorteUpdate(UpdateView):
    model = Cohorte
    form_class = CohorteUpdateForm
    # fields = ['nombre']
    template_name = "cohorte_editar.html"
    # success_url = reverse_lazy('planEstudio:cohorte_listar')
    # template_name_suffix = '_update_form'

    def get_initial(self):  # acá se le pasa el cohorte de origen..... para duplicar
        try:
            a = self.kwargs['pk']
            return {'cohorteId': self.kwargs['pk']}  # pasándole el cohorte de origen
        except:
            pass


    def get_form_kwargs(self, **kwargs):
        kwargs = super(CohorteUpdate, self).get_form_kwargs(**kwargs)
        kwargs.update({'current_user': self.request.user})
        return kwargs


    def get_context_data(self, **kwargs):
        ctx = super(CohorteUpdate, self).get_context_data(**kwargs)
        cohorte = get_object_or_404(Cohorte, pk=self.kwargs['pk'])
        ctx['cohorte'] = cohorte
        ctx['plan'] = cohorte.planEstudioId
        return ctx

    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated():
            return HttpResponseForbidden()
        log_editar(self, request, *args, **kwargs)
        return super(CohorteUpdate, self).post(request, *args, **kwargs)

    def get_success_url(self):
        pk = self.object.pk
        return reverse_lazy('planEstudio:cohorte_detalle',
                            kwargs={'pk': pk})  # así regreso al cohorte y veo sus detalles :P


class CohorteDetailView(DetailView):
    model = Cohorte
    slug_field = 'pk'
    # fields = ['name']
    template_name = "cohorte_detalle.html"

    def get_context_data(self, **kwargs):
        ctx = super(CohorteDetailView, self).get_context_data(**kwargs)
        cohortes = self.get_object()
        ajusteAsig = obtener_asignatura_cohorte(cohortes)
        listAsigCohorte = []
        for a in ajusteAsig:
            listAsigCohorte.append(a)
        ctx['listAsigCohorte'] = listAsigCohorte
        ctx['asig_opt_elec1'] = obtener_asignatura_optativa_electiva()
        ctx['plan'] = cohortes.planEstudioId
        ctx = visibilidad(self, ctx, 'planEstudio', 'asignaturacohorte')
        return ctx


@class_view_decorator(login_required)
@class_view_decorator(permission_required('planEstudio.delete_cohorte'))
class CohorteDelete(DeleteView, DeletionMixin):
    model = Cohorte
    queryset = Cohorte.objects.filter(activo=True)
    template_name = "cohorte_eliminar.html"
    success_url = reverse_lazy('planEstudio:cohorte_listar')

    def get_context_data(self, **kwargs):
        ctx = super(CohorteDelete, self).get_context_data(**kwargs)
        plan = get_object_or_404(PlanEstudio, pk=self.kwargs['pk'])
        ctx['plan'] = plan
        return ctx

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.activo = False
        self.object.save()
        log_eliminar(self, request, *args, **kwargs)
        return HttpResponseRedirect(reverse_lazy('planEstudio:cohorte_listar'))

    def get_success_url(self):
        pk = self.object.pk
        return reverse_lazy('planEstudio:plan_estudio_listar')  # así regreso al cohorte y veo sus detalles :P