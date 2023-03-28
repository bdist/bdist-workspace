# Copyright (c) Flavio Martins.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook:2023-03-27

LABEL maintainer="Flavio Martins <flavio.f.martins@tecnico.ulisboa.pt>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --yes \
    'black' \
    'isort' \
    'psycopg' \
    'psycopg-c' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install Python 3 packages (not available via mamba)
RUN pip install --quiet --no-cache-dir \
    'ipython-sql' \
    'jupyterlab-code-formatter' && \
    fix-permissions "/home/${NB_USER}"
