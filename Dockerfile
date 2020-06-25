FROM debian:buster-20191118-slim

LABEL maintainer.name="Ilham Alizada" \
      maintainer.email="ilham.alizada@hotmail.com"

RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get -y install --no-install-recommends pipenv

WORKDIR /project

COPY . .

RUN pipenv sync

CMD ["pipenv","run","python","-u","server.py"]
