"""
WSGI config for gwu project.

It exposes the WSGI callable as a module-level variable named `application`.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os

from dotenv import load_dotenv
from django.core.wsgi import get_wsgi_application


ENVIRONMENT = os.environ.get("ENVIRONMENT")

if ENVIRONMENT == "local":
    root_path = os.path.abspath(os.pardir)
else:
    root_path = "/app"

env_file_path = "{}/.env.{}".format(root_path, ENVIRONMENT)
load_dotenv(env_file_path)

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'app.settings')

application = get_wsgi_application()
