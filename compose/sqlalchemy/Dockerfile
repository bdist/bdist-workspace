FROM python:3.11.2-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update && apt-get install less -y

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["-c", "import psycopg; import sqlalchemy; print(psycopg.__name__, psycopg.__version__); print(sqlalchemy.__name__, sqlalchemy.__version__)"]
