FROM debian:buster-20191118-slim

LABEL maintainer.name="Ilham Alizada" \
      maintainer.email="ilham.alizada@hotmail.com"

WORKDIR /project

COPY . .

RUN apt update -y \
&& apt upgrade -y \
&& apt install -y pipenv \
&& pipenv sync

CMD ["pipenv","run","python","-u","server.py"]
