# Copyright (c) BDist Development Team
# Distributed under the terms of the Modified BSD License.
FROM python:3.11.6-slim-bookworm

LABEL maintainer="Flavio Martins <flavio.f.martins@tecnico.ulisboa.pt>"

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Requirements are installed here to ensure they will be cached.
COPY ./requirements.txt /app/requirements.txt

# Install the required python dependencies
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

WORKDIR /app

COPY . /app

RUN chmod +x /app/entrypoint /app/start

ENTRYPOINT [ "/app/entrypoint" ]

CMD [ "/app/start" ]
