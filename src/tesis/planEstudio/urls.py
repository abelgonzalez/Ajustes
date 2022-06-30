__author__ = 'Abel'
from django.conf.urls import patterns, url

# from . import views
from planEstudio import views
from planEstudio import metodos
from planEstudio.views_planestudio import PlanEstudioListView, PlanEstudioBuscarListView, PlanEstudioCreate, \
    PlanEstudioDetailView, PlanEstudioUpdate, PlanEstudioDelete

from planEstudio.views_cohorte import CohorteListView, CohorteBuscarListView, CohorteCreate, CohorteDuplicarCreate, \
    CohorteDetailView, CohorteUpdate, CohorteDelete

from planEstudio.views_asignaturacohorte import AsignaturaCohorteListView, AsignaturaCohorteBuscarListView, \
    AsignaturaCohorteCreate, AsignaturaCohorteDetailView, AsignaturaCohorteUpdate, AsignaturaCohorteDelete

from planEstudio.views_asignaturaoptativaelectiva import AsignaturaOptativaElectivaCreate, \
    AsignaturaOptativaElectivaDetailView, AsignaturaOptativaElectivaUpdate, AsignaturaOptativaElectivaDelete


urlpatterns = patterns('',
                       url(r'^$', PlanEstudioListView.as_view(), name='plan_estudio_listar'),
                       url(r'^buscar$', PlanEstudioBuscarListView.as_view(), name='plan_estudio_busqueda'),
                       url(r'^nuevo/$', PlanEstudioCreate.as_view(), name='plan_estudio_nuevo'),
                       url(r'^detalle/(?P<pk>\d+)/$', PlanEstudioDetailView.as_view(), name='plan_estudio_detalle'),
                       url(r'^editar/(?P<pk>\d+)/$', PlanEstudioUpdate.as_view(), name='plan_estudio_editar'),
                       url(r'^eliminar/(?P<pk>\d+)/$', PlanEstudioDelete.as_view(), name='plan_estudio_eliminar'),

                       # url(r'^cohorte/$', CohorteListView.as_view(), name='cohorte_listar'),
                       url(r'^cohorte/nuevo/(?P<pk>\d+)$', CohorteCreate.as_view(), name='cohorte_nuevo'),
                       # url(r'^cohorte/duplicar/(?P<pk>\d+)/$', CohorteDuplicarCreate.as_view(),
                       #    name='cohorte_duplicar'),  # pasándole el cohorte de donde viene, el q se quiere duplicar

                       # url(r'^cohorte/nuevo/(?P<pk>\d+)/$', CohorteCreate.as_view(),
                       #    name='asignaturacohorte_nuevo'),
                       url(r'^cohorte/detalle/(?P<pk>\d+)/$', CohorteDetailView.as_view(), name='cohorte_detalle'),
                       url(r'^cohorte/editar/(?P<pk>\d+)/$', CohorteUpdate.as_view(), name='cohorte_editar'),
                       url(r'^cohorte/eliminar/(?P<pk>\d+)/$', CohorteDelete.as_view(), name='cohorte_eliminar'),
                       url(r'^cohorte/buscar/$', CohorteBuscarListView.as_view(), name='cohorte_busqueda'),

                       url(r'^asignaturacohorte/$', AsignaturaCohorteListView.as_view(),
                           name='asignaturacohorte_listar'),
                       url(r'^asignaturacohorte/nuevo/(?P<pk>\d+)/$', AsignaturaCohorteCreate.as_view(),
                           name='asignaturacohorte_nuevo'),  # pasándole el cohorte de donde viene
                       url(r'^asignaturacohorte/detalle/(?P<pk>\d+)/$', AsignaturaCohorteDetailView.as_view(),
                           name='asignaturacohorte_detalle'),
                       url(r'^asignaturacohorte/editar/(?P<pk>\d+)/$', AsignaturaCohorteUpdate.as_view(),
                           name='asignaturacohorte_editar'),
                       url(r'^asignaturacohorte/eliminar/(?P<pk>\d+)/$', AsignaturaCohorteDelete.as_view(),
                           name='asignaturacohorte_eliminar'),
                       url(r'^asignaturacohorte/buscar/$', AsignaturaCohorteBuscarListView.as_view(),
                           name='asignaturacohorte_busqueda'),

                       url(r'^asignaturaoptativaelectiva/nuevo/(?P<pk>\d+)/$',
                           AsignaturaOptativaElectivaCreate.as_view(),
                           name='asignaturaoptativaelectiva_nuevo'),  # pasándole el la asign de donde viene
                       url(r'^asignaturaoptativaelectiva/detalle/(?P<pk>\d+)/$',
                           AsignaturaOptativaElectivaDetailView.as_view(), name='asignaturaoptativaelectiva_detalle'),
                       url(r'^asignaturaoptativaelectiva/editar/(?P<pk>\d+)/$',
                           AsignaturaOptativaElectivaUpdate.as_view(), name='asignaturaoptativaelectiva_editar'),
                       url(r'^asignaturaoptativaelectiva/eliminar/(?P<pk>\d+)/$',
                           AsignaturaOptativaElectivaDelete.as_view(), name='asignaturaoptativaelectiva_eliminar'),


                       url(r'^obtener_facultadAJAX/', metodos.obtener_facultadAJAX, name='obtener_facultadAJAX'),
                       url(r'^obtener_carreraAJAX/', metodos.obtener_carreraAJAX, name='obtener_carreraAJAX'),
                       url(r'^obtener_tipocursoAJAX/', metodos.obtener_tipocursoAJAX, name='obtener_tipocursoAJAX'),
                       url(r'^obtener_plandeestudioAJAX/', metodos.obtener_plandeestudioAJAX,
                           name='obtener_plandeestudioAJAX'),
                       url(r'^obtener_cursoAJAX/', metodos.obtener_cursoAJAX, name='obtener_cursoAJAX'),
                       url(r'^obtener_cohorteAJAX/', metodos.obtener_cohorteAJAX, name='obtener_cohorteAJAX'),


                       url(r'^asignaturacohorte/buscar/$', views.searchAsignaturaCohorte,
                           name='asignaturacohorte_busqueda'),
                       url(r'^asignaturacohorte/buscar/$', views.searchAsignaturaCohorte,
                           name='asignaturacohorte_busqueda'),

                       url(r'^universidad/', metodos.obtener_universidadAJAX, name='obtener_universidadAJAX'),
                       url(r'^facultad/', metodos.obtener_facultadAJAX, name='obtener_facultadAJAX'),
                       url(r'^obtener_UniFaculAJAX/', metodos.obtener_UniFaculAJAX, name='obtener_UniFaculAJAX'),


                       url(r'^comparar/', views.comparar, name='comparar'),
                       url(r'^comparar_resultados/(?P<cohorteprev_id>\d+)/(?P<cohorteact_id>\d+)/$',
                           views.comparar_resultados, name='comparar_resultados'),
                       url(r'^cohorte_duplicar/',
                           views.cohorte_duplicar, name='cohorte_duplicar'),
                       url(r'^cohorte_duplicar_resultados/(?P<pk>\d+)$',
                           CohorteDuplicarCreate.as_view(), name='cohorte_duplicar_resultados'),
                       # url(r'^guardar_cambios/(?P<plan_id>\d+)/$', views.guardar_cambios, name='guardar_cambios'),
                       # url(r'^guardar_cambios_detalle_asignatura/(?P<asig_id>\d+)/$',
                       #     views.guardar_cambios_detalle_asignatura, name='guardar_cambios_detalle_asignatura'),
)