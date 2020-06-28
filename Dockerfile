FROM python:3.7.7-slim-buster

LABEL maintainer.name="Ilham Alizada" \
      maintainer.email="ilham.alizada@hotmail.com"

RUN apt-get update \
&& apt-get -y install --no-install-recommends pipenv \
&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /project

COPY Pipfile* ./

RUN pipenv sync

COPY *.py ./

CMD ["pipenv","run","python","-u","server.py"]
