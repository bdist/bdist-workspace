# Copyright (c) Flavio Martins <flavio.f.martins@tecnico.ulisboa.pt>
# Distributed under the terms of the Modified BSD License.
FROM python:3.10.11-slim-bullseye

LABEL maintainer="Flavio Martins <flavio.f.martins@tecnico.ulisboa.pt>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install missing Debian packages
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    less && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

WORKDIR /app

ENTRYPOINT [ "flask", "run", "--host=0.0.0.0", "--port=5001" ]
