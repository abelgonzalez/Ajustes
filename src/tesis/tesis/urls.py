from django.conf.urls import patterns, include, url
from django.contrib import admin
from main import views

handler404 = 'main.views.my_custom_page_not_found_view'
handler500 = 'mysite.views.my_custom_error_view'
handler403 = 'mysite.views.my_custom_permission_denied_view'
handler400 = 'mysite.views.my_custom_bad_request_view'

urlpatterns = patterns('',
                       url(r'^admin/', include(admin.site.urls)),
                       # éstas son las que importé
                       url(r'^$', views.autenticar, name='autenticar'),
                       url(r'^acerca/', views.acerca, name='acerca'),
                       url(r'^contacto/', views.contacto, name='contacto'),
                       url(r'^autenticar/', views.autenticar, name='autenticar'),
                       url(r'^cerrar_sesion/', views.cerrar_sesion, name='cerrar_sesion'),
                       url(r'^tiempo/', views.tiempo, name='tiempo'),
                       # apps
                       url(r'^main/', include('main.urls')),
                       url(r'^planEstudio/', include('planEstudio.urls', namespace='planEstudio')),
                       url(r'^persona/', include('persona.urls', namespace='persona')),
                       url(r'^ajustes/', include('ajustes.urls', namespace='ajustes')),
                       url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
                       url(r'^admin/', include(admin.site.urls)),
                       # TODO
                       # url(r'^accounts/login/$', login),
                       # url(r'^accounts/logout/$', logout),
                       # url(r'^logout/$', 'django.contrib.auth.views.logout', {'next_page': '/successfully_logged_out/'})
)

