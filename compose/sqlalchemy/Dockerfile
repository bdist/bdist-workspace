FROM python:3.11.2-slim-bullseye

# Makes the default answers be used for all questions
ARG DEBIAN_FRONTEND=noninteractive

# Install missing Debian packages
RUN apt-get update && apt-get install less -y

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["-c", "import psycopg; import sqlalchemy; print(psycopg.__name__, psycopg.__version__); print(sqlalchemy.__name__, sqlalchemy.__version__)"]
