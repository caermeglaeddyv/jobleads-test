FROM debian:buster-20191118-slim

LABEL maintainer.name="Ilham Alizada" \
      maintainer.email="ilham.alizada@hotmail.com"

RUN apt update -y \
&& apt upgrade -y \
&& apt install -y pipenv

WORKDIR /project

COPY . .

RUN pipenv sync

CMD ["pipenv","run","python","-u","server.py"]
