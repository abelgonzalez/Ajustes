__author__ = 'Abel'
from django.conf.urls import patterns, url

from ajustes.views_ajusteestudiante import AjusteEstudianteListView, AjusteEstudianteBuscarListView, \
    AjusteEstudianteDetailView, AjusteEstudianteDelete, ajusteestudiante_nuevo, ajusteestudiante_nuevo_asistente, \
    ajusteestudiante_editar_asistente

from ajustes.views_aprobacionajuste import AjusteEstudianteProgresoListView, AprobacionAjusteAprobadoListView, \
    AprobacionAjustePendienteListView, AprobacionAjusteDevueltoListView, AprobacionExpedienteAprobadoListView, \
    AprobacionExpedientePendienteListView, AprobacionExpedienteDevueltoListView

from ajustes.views import aprobacion_ajuste_proceso

from ajustes.metodos import validar_datos_ajusteAJAX, datos_ajusteAJAX, datos_ajusteestudiante, listAsigCohorteAJAX, \
    obtener_ajusteestudianteAJAX, ajuste_guardar, anho_semestre, ajuste_editar_guardar

urlpatterns = patterns('',
                       url(r'^ajusteEstudiante/$', AjusteEstudianteListView.as_view(), name='ajusteestudiante_listar'),

                       url(r'^ajusteestudiante/nuevo/$', ajusteestudiante_nuevo, name='ajusteestudiante_nuevo'),

                       url(r'^ajusteestudiante/nuevo/(?P<pk>\d+)/$', ajusteestudiante_nuevo_asistente,
                           name='ajusteestudiante_nuevo_asistente'),


                       url(r'^validar_datos_ajusteAJAX/$', validar_datos_ajusteAJAX, name='validar_datos_ajusteAJAX'),

                       url(r'^datos_ajusteAJAX/$', datos_ajusteAJAX, name='datos_ajusteAJAX'),

                       url(r'^listAsigCohorteAJAX/(?P<cohorteId>\d+)/', listAsigCohorteAJAX,
                           name='listAsigCohorteAJAX'),

                       url(r'^anho_semestre/(?P<cohorteId>\d+)/', anho_semestre, name='anho_semestre'),

                       url(r'^obtener_ajusteestudianteAJAX/$', obtener_ajusteestudianteAJAX,
                           name='obtener_ajusteestudianteAJAX'),

                       url(r'^datos_ajusteestudiante/', datos_ajusteestudiante, name='datos_ajusteestudiante'),

                       url(r'^ajuste_guardar/(?P<anhoSemestreId>\d+)/$', ajuste_guardar, name='ajuste_guardar'),


                       url(r'^ajusteestudiante/editar/(?P<pk>\d+)/$', ajusteestudiante_editar_asistente,
                           name='ajusteestudiante_editar_asistente'),


                       url(r'^ajusteestudiante/editar_guardar/(?P<pk>\d+)/$', ajuste_editar_guardar,
                           name='ajuste_editar_guardar'),


                       url(r'^ajusteestudiante/detalle/(?P<pk>\d+)/$', AjusteEstudianteDetailView.as_view(),
                           name='ajusteestudiante_detalle'),

                       url(r'^ajusteestudiante/eliminar/(?P<pk>\d+)/$', AjusteEstudianteDelete.as_view(),
                           name='ajusteestudiante_eliminar'),
                       url(r'^ajusteestudiante/buscar/$', AjusteEstudianteBuscarListView.as_view(),
                           name='ajusteestudiante_busqueda'),


                       url(r'^ajusteestudiante/progreso/(?P<pk>\d+)/$', AjusteEstudianteProgresoListView.as_view(),
                           name='ajusteestudiante_progreso'),

                       url(r'^aprobacionexpediente_aprobado/$', AprobacionExpedienteAprobadoListView.as_view(),
                           name='aprobacionexpediente_aprobado_listar'),
                       url(r'^aprobacionexpediente_pendiente/$', AprobacionExpedientePendienteListView.as_view(),
                           name='aprobacionexpediente_pendiente_listar'),
                       url(r'^aprobacionexpediente_devuelto/$', AprobacionExpedienteDevueltoListView.as_view(),
                           name='aprobacionexpediente_devuelto_listar'),

                       url(r'^aprobacionajuste_aprobado/$', AprobacionAjusteAprobadoListView.as_view(),
                           name='aprobacionajuste_aprobado_listar'),
                       url(r'^aprobacionajuste_pendiente/$', AprobacionAjustePendienteListView.as_view(),
                           name='aprobacionajuste_pendiente_listar'),
                       url(r'^aprobacionajuste_devuelto/$', AprobacionAjusteDevueltoListView.as_view(),
                           name='aprobacionajuste_devuelto_listar'),

                       url(r'^aprobacion_ajuste_proceso/(?P<pk>\d+)/(?P<accion>\d+)/$', aprobacion_ajuste_proceso,
                           name='aprobacion_ajuste_proceso'),



)