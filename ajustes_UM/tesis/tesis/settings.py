"""
Django settings for tesis project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""
# -*- coding: utf-8 -*-
# A tuple that lists people who get code error notifications.
ADMINS = (
    ('Abel González Mondéjar', 'abelglez89@gmail.com'),
)

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
from django.conf import global_settings

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'a6c$xd0y%_#%&ucf!uzu0cuc)6-+b+t5(63u#a__!^3cnhk)#l'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# A boolean that turns on/off template debug mode.
TEMPLATE_DEBUG = True

# A list of strings representing the host/domain names that this Django site can serve.
ALLOWED_HOSTS = []


# Application definition

# A tuple of strings designating all applications that are enabled in this Django installation
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',

    # otras apps
    'pure_pagination',
    'watson',


    # Mis Apps
    'ajustes',
    'persona',
    'planEstudio',

    # importada y modificada
    'main',
)
PAGINATION_SETTINGS = {
    'PAGE_RANGE_DISPLAYED': 10,
    'MARGIN_PAGES_DISPLAYED': 1,
}
# Middleware is a framework of hooks into Django’s request/response processing.
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

# A string representing the full Python import path to your root URLconf.
ROOT_URLCONF = 'tesis.urls'

# The full Python path of the WSGI application object that Django’s built-in servers (e.g. runserver) will use.
WSGI_APPLICATION = 'tesis.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

# A dictionary containing the settings for all databases to be used with Django.
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'OPTIONS': {
            'read_default_file': os.path.join(BASE_DIR, 'my.cnf'),
            'init_command': 'SET storage_engine=INNODB',
        },
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

# Language code for this installation.
LANGUAGE_CODE = 'es-CU'

# A boolean that specifies whether Django’s translation system should be enabled.
# This provides an easy way to turn it off, for performance. If this is set to False,
# Django will make some optimizations so as not to load the translation machinery.
USE_I18N = True

# A boolean that specifies if localized formatting of data will be enabled by default or not.
# If this is set to True, e.g. Django will display numbers and dates using the format of the current locale.
USE_L10N = True

# A boolean that specifies if datetimes will be timezone-aware by default or not.
# If this is set to True, Django will use timezone-aware datetimes internally.
# Otherwise, Django will use naive datetimes in local time.
USE_TZ = True

# Number representing the first day of the week.
FIRST_DAY_OF_WEEK = 1

from django.utils.translation import ugettext_lazy as _

# A tuple of all available languages.
LANGUAGES = (
    ('es', _('Español')),
    ('en', _('English')),
)

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

# URL to use when referring to static files located in STATIC_ROOT.
# Example: "http://media.lawrence.com/static/"
# Esto debe configurarse de manera similar que el media para poder servir archivos estáticos
# Puede ser algo como esta linea comentada
# STATIC_URL = 'http://localhost:90/static/'
STATIC_URL = '/static/'

# Local time zone for this installation.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/Havana'

# List of locations of the template source files searched by django.template.loaders.filesystem.Loader, in search order.
# Note that these paths should use Unix-style forward slashes, even on Windows.
TEMPLATE_DIRS = (
    os.path.join(os.path.dirname(__file__), '..', 'templates').replace('\\', '/'),)


# This setting defines the additional locations the staticfiles app will traverse if the FileSystemFinder finder is
# enabled, e.g. if you use the collectstatic or findstatic management command or use the static file serving view.
STATICFILES_DIRS = ((os.path.join(BASE_DIR, 'assets')),
                    (os.path.join(BASE_DIR, 'media')))


# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = (os.path.join(BASE_DIR, 'static'))  # URL prefix for static files.

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
# MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'assets/upload')  # COMENTADO
PROJECT_PATH = os.path.dirname(os.path.dirname(__file__))
PROJECT_ROOT = os.path.join("../", PROJECT_PATH)
MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'media/')


# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
# Configurar esta línea es importante puede quedar algo así:
# MEDIA_URL = 'http://localhost:90/media/'
# MEDIA_URL = 'http://127.0.0.1:8000/media/'  # COMENTADO

# estas las importé también
# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}


# The URL where requests are redirected after login when the contrib.auth.login view gets no next parameter.
LOGIN_REDIRECT_URL = '/'

# The URL where requests are redirected for login, especially when using the login_required() decorator.
LOGIN_URL = '/'

# LOGIN_URL counterpart.
LOGOUT_URL = '/logoutUser'

# TEMPLATE_CONTEXT_PROCESSORS = (
# 'django.contrib.auth.context_processors.auth',
#     'django.core.context_processors.request',
# )

TEMPLATE_CONTEXT_PROCESSORS = global_settings.TEMPLATE_CONTEXT_PROCESSORS + (
    "django.core.context_processors.request",
)