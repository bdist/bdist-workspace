FROM jupyter/scipy-notebook:2023-03-20

LABEL maintainer="Flavio Martins <flavio.f.martins@tecnico.ulisboa.pt>"

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --yes \
    psycopg \
    psycopg-c
