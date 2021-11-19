# syntax=docker/dockerfile:1

FROM python:3.9.5-slim-buster

WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]