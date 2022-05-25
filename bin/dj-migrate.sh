#!/usr/bin/env bash

if [ -z "$DEFAULT_EMAIL" ]; then
    DEFAULT_EMAIL="admin@gmail.com"
    DEFAULT_USER="admin@gmail.com"
    DEFAULT_PASS="123456"
fi

bin/dj.sh migrate

echo "Create super user if does not exist ..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='$DEFAULT_USER').exists() or User.objects.create_superuser('$DEFAULT_USER', '$DEFAULT_EMAIL', '$DEFAULT_PASS')" | python src/manage.py shell
echo "from django.contrib.auth import get_user_model; User = get_user_model(); admin = User.objects.get(email='$DEFAULT_EMAIL'); admin.role_id = 2; admin.save()" | python src/manage.py shell
