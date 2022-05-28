from django.conf.urls import patterns, url

from main import views


urlpatterns = patterns('',
                       url(r'^$', views.inicio, name='inicio'),
                       url(r'^acerca/', views.acerca, name='acerca'),
                       url(r'^contacto/', views.contacto, name='contacto'),
                       url(r'^autenticar/', views.autenticar, name='autenticar'),
                       url(r'^cerrar_sesion/', views.cerrar_sesion, name='cerrar_sesion'),
                       url(r'^tiempo/', views.tiempo, name='tiempo'),
                       url(r'^perfil/(?P<usuario>\d+)/$', views.perfil, name='perfil'),
                       url(r'^imprimir_ajuste/', views.imprimir_ajuste, name='imprimir_ajuste'),
                       url(r'^imprimir_ajusteId/(?P<ajusteEstudianteId>\d+)/$', views.imprimir_ajusteId,
                           name='imprimir_ajusteId'),
                       url(r'^imprimir_expediente/', views.imprimir_expediente, name='imprimir_expediente'),
                       url(r'^imprimir_expedienteId/(?P<expedienteEstudianteId>\d+)/$', views.imprimir_expedienteId,
                           name='imprimir_expedienteId'),

)