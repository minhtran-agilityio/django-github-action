#!/usr/bin/env python
import os
import sys
from dotenv import load_dotenv


if __name__ == '__main__':
    ENVIRONMENT = os.environ.get("ENVIRONMENT")

    root_path = os.path.abspath(os.path.join(
            os.path.abspath(os.path.join(__file__, os.pardir)), os.pardir))

    env_file_path = "{}/.env.{}".format(root_path, ENVIRONMENT)
    load_dotenv(env_file_path)

    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'app.settings')

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)
