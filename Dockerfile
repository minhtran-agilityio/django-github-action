FROM python:3.9.7-slim

## Set environment variables

# Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1
ENV APP_DIR /app

WORKDIR $APP_DIR

# Install OS packages
# Install OS packages
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential curl libpq-dev

RUN pip3 install --upgrade pip

# Install pip-tools
RUN pip3 install pip-tools

# Get packages and complie denpendencies packages
# Install requirements packages
COPY requirements.in .
RUN pip-compile requirements.in
RUN pip install -r requirements.txt

COPY . $APP_DIR

ENV PYTHONPATH=$APP_DIR/src

EXPOSE 8000

ENTRYPOINT ["./bin/entrypoint.sh"]
