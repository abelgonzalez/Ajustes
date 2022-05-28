__author__ = 'Abel'
from django.utils.decorators import method_decorator
import re
from django.db.models import Q
import watson
from django.http import HttpResponseForbidden, Http404
from django.contrib.auth.models import Group

from django.contrib.admin.models import LogEntry, ADDITION, CHANGE, DELETION

from django.contrib.contenttypes.models import ContentType
from django.utils.encoding import force_text
# de ajustes
from ajustes.nomencladores.nomencladorAjuste import *
from ajustes.models import *

watson.register(MotivoAjuste)
watson.register(DocumentacionAnalizada)
watson.register(Situacion)
watson.register(AjusteEstudiante)
watson.register(AjusteAsignatura)
watson.register(AjusteAsignaturaConvalidada)

# de persona
from persona.nomencladores.nomencladorEstudiante import *
from persona.nomencladores.nomencladorPersona import *
from persona.nomencladores.nomencladorTrabajador import *
from persona.models import *

watson.register(Carrera)
watson.register(CarreraTipoDeCurso)
watson.register(Facultad)
watson.register(TipoDeCurso)
watson.register(Universidad)
watson.register(Etnia)
watson.register(GradoCientifico)
watson.register(Municipio)
watson.register(Nacionalidad)
watson.register(Pais)
watson.register(Provincia)
watson.register(Sexo)
watson.register(Ubicacion)
watson.register(Departamento)
watson.register(CategoriaDocente)
watson.register(Estudiante)
watson.register(Trabajador)

# de plan de estudio
from planEstudio.nomencladores.nomencladorAsigPlanEstudio import *
from planEstudio.nomencladores.nomencladorPlanEstudio import *
from planEstudio.models import *

watson.register(Asignatura)
watson.register(TipoAsignatura)
watson.register(Disciplina)
watson.register(Curriculo)
watson.register(TipoEvaluacion)
watson.register(Curso)
watson.register(Anho)
watson.register(Semestre)
watson.register(AnhoSemestre)
watson.register(PlanEstudio)
watson.register(Cohorte)
watson.register(CarreraEstudiante)
watson.register(AsignaturaCohorte)
watson.register(AsignaturaVencida)
watson.register(AsignaturaOptativaElectiva)

# de servicio


def class_view_decorator(function_decorator):
    """Convert a function based decorator into a class based decorator usable
    on class based Views.

    Can't subclass the `View` as it breaks inheritance (super in particular),
    so we monkey-patch instead.
    """

    def simple_decorator(View):
        View.dispatch = method_decorator(function_decorator)(View.dispatch)
        return View

    return simple_decorator


def normalize_query(query_string,
                    findterms=re.compile(r'"([^"]+)"|(\S+)').findall,
                    normspace=re.compile(r'\s{2,}').sub):
    ''' Splits the query string in invidual keywords, getting rid of unecessary spaces
        and grouping quoted words together.
        Example:

        >>> normalize_query('  some random  words "with   quotes  " and   spaces')
        ['some', 'random', 'words', 'with quotes', 'and', 'spaces']

    '''
    return [normspace(' ', (t[0] or t[1]).strip()) for t in findterms(query_string)]


def get_query(query_string, search_fields):
    ''' Returns a query, that is a combination of Q objects. That combination
        aims to search keywords within a model by testing the given search fields.

    '''
    query = None  # Query to search for every search term
    terms = normalize_query(query_string)
    for term in terms:
        or_query = None  # Query to search for a given term in each field
        for field_name in search_fields:
            q = Q(**{"%s__icontains" % field_name: term})
            if or_query is None:
                or_query = q
            else:
                or_query = or_query | q
        if query is None:
            query = or_query
        else:
            query = query & or_query
    return query


def group_required(groups=[]):
    try:
        from functools import wraps
    except:
        from django.utils.functional import wraps

    def decorator(func):
        def inner_decorator(request, *args, **kwargs):
            for group in groups:
                try:
                    if Group.objects.get(name=group) in request.user.groups.all():
                        return func(request, *args, **kwargs)
                except:
                    pass

            raise Http404()

        return wraps(func)(inner_decorator)

    return decorator


def visibilidad(self, ctx, app, nombreDeTabla):
    permisos = User.get_all_permissions(self.request.user)
    test = app + '.add_' + nombreDeTabla
    if app + '.add_' + nombreDeTabla in permisos:
        ctx['nuevo_visible'] = True
    if app + '.change_' + nombreDeTabla in permisos or app + '.delete_' + nombreDeTabla in permisos:
        ctx['acciones_visible'] = True
        if app + '.change_' + nombreDeTabla in permisos:
            ctx['acciones_editar'] = True
        if app + '.delete_' + nombreDeTabla in permisos:
            ctx['acciones_eliminar'] = True
    return ctx


def busqueda(self, atributos, Tabla):
    object_list = ''
    try:
        criterio = self.request.REQUEST.get("q")
    except:
        criterio = ''
    if criterio != '':
        try:
            object_list1 = get_query(criterio, atributos)
            object_list = consulta(self, Tabla, object_list1)  # pasándole la consulta Q
            # object_list = Tabla.objects.filter(object_list1, activo=True)
        except:
            if not criterio:
                object_list = consulta(self, Tabla)
                # object_list = Tabla.objects.filter(activo=True)
            else:
                try:
                    tmp = consulta(self, Tabla)
                    object_list = watson.filter(tmp, criterio)
                except:
                    object_list = ""
                    # object_list = watson.filter(Tabla.objects.filter(activo=True), criterio)
    else:
        object_list = consulta(self, Tabla)  # Tabla.objects.filter(activo=True)
    return object_list


def log_nuevo(self, form):
    LogEntry.objects.log_action(
        user_id=self.request.user.pk,
        content_type_id=ContentType.objects.get_for_model(self.object).pk,
        object_id=self.object.pk,
        change_message="Agregado/a",
        object_repr=force_text(self.object),
        action_flag=ADDITION)


def log_nuevo1(obj, request):
    LogEntry.objects.log_action(
        user_id=request.user.pk,
        content_type_id=ContentType.objects.get_for_model(obj).pk,
        object_id=obj.pk,
        change_message="Agregado/a",
        object_repr=force_text(obj),
        action_flag=ADDITION)


def log_editar(self, request, *args, **kwargs):
    self.object = self.get_object()
    LogEntry.objects.log_action(
        user_id=request.user.pk,
        content_type_id=ContentType.objects.get_for_model(self.object).pk,
        object_id=self.object.pk,
        change_message="Modificado/a",
        object_repr=force_text(self.object),
        action_flag=CHANGE
    )


def log_editar1(obj, request):
    LogEntry.objects.log_action(
        user_id=request.user.pk,
        content_type_id=ContentType.objects.get_for_model(obj).pk,
        object_id=obj.pk,
        change_message="Modificado/a",
        object_repr=force_text(obj),
        action_flag=CHANGE
    )


def log_eliminar(self, request, *args, **kwargs):
    LogEntry.objects.log_action(
        user_id=request.user.pk,
        content_type_id=ContentType.objects.get_for_model(self.object).pk,
        object_id=self.object.pk,
        change_message="Deshabilitado/a",
        object_repr=force_text(self.object),
        action_flag=DELETION
    )


def log_eliminar1(obj, request):
    LogEntry.objects.log_action(
        user_id=request.user.pk,
        content_type_id=ContentType.objects.get_for_model(obj).pk,
        object_id=obj.pk,
        change_message="Deshabilitado/a",
        object_repr=force_text(obj),
        action_flag=DELETION
    )


def consulta(self, Tabla, args):
    if args:
        a = Tabla.objects.filter(args, activo=True)  # esto es para el caso que se haga una búsqueda
    else:
        a = Tabla.objects.filter(activo=True)
    mod = ContentType.objects.get_for_model(Tabla).pk
    # datos = LogEntry.objects.filter(user_id=self.request.user.pk, content_type_id=mod)
    user = self.request.user
    toma = []
    try:
        datos = LogEntry.objects.filter(user_id=user, content_type_id=mod)
        for i in a:
            for j in datos:
                if (i.pk == int(j.object_id)) and (i.activo == True) and (not toma.__contains__(i)):
                    toma.append(i)
    except:
        pass

    return toma


def visibilidad_tiles(request):
    permisos = User.get_group_permissions(request.user)
    if permisos.__contains__('auth.add_user'):
        request.session["administrador"] = True
        request.session["decano"] = False
        request.session["coordinador"] = False
        request.session["secretaria"] = False
        a = expedientes_aprobados_coordinador(
            request).count() + expedientes_aprobados_secretaria(request).count()
        request.session["expedientes_aprobados_tile"] = a
        b = expedientes_pendientes_coordinador(
            request).count() + expedientes_pendientes_secretaria(request).count()
        request.session["expedientes_pendientes_tile"] = b
        c = expedientes_devueltos_coordinador(
            request).count() + expedientes_devueltos_secretaria(request).count()
        request.session["expedientes_devueltos_tile"] = c
        d = ajustes_aprobados_decano(
            request).count() + ajustes_aprobados_coordinador(request).count()
        request.session["ajustes_aprobados_tile"] = d
        e = ajustes_pendientes_decano(
            request).count() + ajustes_pendientes_coordinador(request).count() + ajustes_pendientes_secretaria(
            request).count()
        request.session["ajustes_pendientes_tile"] = e
        f = ajustes_devueltos_coordinador(request).count() + ajustes_devueltos_decano(request).count()
        request.session["ajustes_devueltos_tile"] = f
    elif permisos.__contains__('ajustes.approve_ajusteestudiante'):
        request.session["decano"] = True
        request.session["administrador"] = False
        request.session["coordinador"] = False
        request.session["secretaria"] = False
        request.session["expedientes_aprobados_tile"] = '-'
        request.session["expedientes_pendientes_tile"] = '-'
        request.session["expedientes_devueltos_tile"] = '-'
        request.session["ajustes_aprobados_tile"] = ajustes_aprobados_decano(request).count()
        request.session["ajustes_pendientes_tile"] = ajustes_pendientes_decano(request).count()
        request.session["ajustes_devueltos_tile"] = '-'
    elif permisos.__contains__('ajustes.add_ajusteasignatura'):
        request.session["coordinador"] = True
        request.session["administrador"] = False
        request.session["decano"] = False
        request.session["secretaria"] = False
        request.session["expedientes_aprobados_tile"] = expedientes_aprobados_coordinador(request).count()
        request.session["expedientes_pendientes_tile"] = expedientes_pendientes_coordinador(request).count()
        request.session["expedientes_devueltos_tile"] = expedientes_devueltos_coordinador(request).count()
        request.session["ajustes_aprobados_tile"] = ajustes_aprobados_coordinador(request).count()
        request.session["ajustes_pendientes_tile"] = ajustes_pendientes_coordinador(request).count()
        request.session["ajustes_devueltos_tile"] = ajustes_devueltos_coordinador(request).count()
    elif permisos.__contains__('persona.add_estudiante'):
        request.session["secretaria"] = True
        request.session["administrador"] = False
        request.session["coordinador"] = False
        request.session["decano"] = False
        request.session["expedientes_aprobados_tile"] = expedientes_aprobados_secretaria(request).count()
        request.session["expedientes_pendientes_tile"] = expedientes_pendientes_secretaria(request).count()
        request.session["expedientes_devueltos_tile"] = expedientes_devueltos_secretaria(request).count()
        request.session["ajustes_aprobados_tile"] = '-'
        request.session["ajustes_pendientes_tile"] = ajustes_pendientes_secretaria(request).count()
        request.session["ajustes_devueltos_tile"] = '-'


def expedientes_aprobados_secretaria(request):
    exp_apr_sec = AprobacionDeAjuste.objects.filter(
        Q(estadoId=3) | Q(estadoId=4) | Q(estadoId=5) | Q(estadoId=6) | Q(estadoId=7) | Q(estadoId=8) | Q(
            estadoId=9) | Q(estadoId=10) | Q(estadoId=11), activo=True)
    return exp_apr_sec


def expedientes_pendientes_secretaria(request):
    exp_pend_sec = AprobacionDeAjuste.objects.filter(Q(estadoId=1) | Q(estadoId=4), activo=True)
    return exp_pend_sec


def expedientes_devueltos_secretaria(request):
    exp_dev_sec = AprobacionDeAjuste.objects.filter(Q(estadoId=4), activo=True)
    return exp_dev_sec


def ajustes_pendientes_secretaria(request):
    aj_pend_sec = AprobacionDeAjuste.objects.filter(Q(estadoId=6) | Q(estadoId=8) | Q(estadoId=9), activo=True)
    return aj_pend_sec


def expedientes_aprobados_coordinador(request):
    exp_apr_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=3), activo=True)
    return exp_apr_coord


def expedientes_pendientes_coordinador(request):
    exp_pend_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=2), activo=True)
    return exp_pend_coord


def expedientes_devueltos_coordinador(request):
    exp_dev_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=4), activo=True)
    return exp_dev_coord


def ajustes_aprobados_coordinador(request):
    aj_apr_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=6) | Q(estadoId=8) | Q(estadoId=9) | Q(estadoId=11),
                                                     activo=True)
    return aj_apr_coord


def ajustes_pendientes_coordinador(request):
    aj_pend_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=3) | Q(estadoId=5), activo=True)
    return aj_pend_coord


def ajustes_devueltos_coordinador(request):
    aj_dev_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=10), activo=True)
    return aj_dev_coord


def ajustes_aprobados_decano(request):
    aj_apr_dec = AprobacionDeAjuste.objects.filter(Q(estadoId=8) | Q(estadoId=11), activo=True)
    return aj_apr_dec


def ajustes_pendientes_decano(request):
    aj_pend_dec = AprobacionDeAjuste.objects.filter(Q(estadoId=7), activo=True)
    return aj_pend_dec


def ajustes_devueltos_decano(request):
    aj_dev_coord = AprobacionDeAjuste.objects.filter(Q(estadoId=9), activo=True)
    return aj_dev_coord