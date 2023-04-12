FROM python:3.10.11-slim-bullseye

# Install missing Debian packages
COPY install-packages.sh .
RUN ./install-packages.sh

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY . /app

WORKDIR /app

# Install pip requirements
RUN pip install --no-cache-dir -r requirements.txt

RUN sed -i 's/\r$//g' /app/start
RUN chmod +x /app/start

ENTRYPOINT [ "/app/start" ]
