__author__ = 'Abel'
from django.conf.urls import patterns, url
from persona.views import listAsigCohorteAJAX, datos_estudianteAJAX, datos_estudiante_vencidas
from persona.views_estudiante import EstudianteListView, EstudianteBuscarListView, EstudianteDetailView, \
    EstudianteDelete, estudiante_nuevo, expediente_guardar, estudiante_editar, expediente_guardar_edicion
from persona.metodos import validar_datos_estudianteAJAX, datos_estudiante_vencidasAJAX

urlpatterns = patterns('',
                       url(r'^$', EstudianteListView.as_view(), name='estudiante_listar'),
                       url(r'^buscar$', EstudianteBuscarListView.as_view(), name='estudiante_busqueda'),
                       url(r'^nuevo/$', estudiante_nuevo, name='estudiante_nuevo'),
                       url(r'^detalle/(?P<pk>\d+)/$', EstudianteDetailView.as_view(), name='estudiante_detalle'),
                       url(r'^editar/(?P<pk>\d+)/$', estudiante_editar, name='estudiante_editar'),
                       url(r'^eliminar/(?P<pk>\d+)/$', EstudianteDelete.as_view(), name='estudiante_eliminar'),
                       url(r'^validar_datos_estudianteAJAX/$', validar_datos_estudianteAJAX,
                           name='validar_datos_estudianteAJAX'),
                       url(r'^datos_estudianteAJAX/$', datos_estudianteAJAX, name='datos_estudianteAJAX'),
                       url(r'^listAsigCohorteAJAX/(?P<cohorteId>\d+)/$', listAsigCohorteAJAX, name='listAsigCohorte'),
                       url(r'^datos_estudiante_vencidas/(?P<asignaturas>[\w\-]+)$', datos_estudiante_vencidas,
                           name='datos_estudiante_vencidas'),
                       url(r'^expediente_guardar/$', expediente_guardar, name='expediente_guardar'),
                       url(r'^expediente_guardar_edicion/(?P<pk>\d+)/$', expediente_guardar_edicion,
                           name='expediente_guardar_edicion'),
)