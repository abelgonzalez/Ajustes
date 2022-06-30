#!/usr/bin/env python
import os
import sys
from django.conf import settings
#print settings.TEMPLATE_CONTEXT_PROCESSORS


if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tesis.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
