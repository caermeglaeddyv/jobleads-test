# Use image with static python version to support better 
# maintenance options and avoid breaks in the future
FROM python:3.7.7-slim-buster

LABEL maintainer.name="Ilham Alizada" \
      maintainer.email="ilham.alizada@hotmail.com"

# Update package index from the sources,
# install pipenv and cleanup packages and system
RUN apt-get update \
&& apt-get -y install --no-install-recommends pipenv \
&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
&& rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /project

# Copy files important for installation of app dependencies
COPY Pipfile* ./

# Download app dependencies
RUN pipenv sync

# Copy source code of the app
COPY *.py ./

# Run application with pipenv
CMD ["pipenv","run","python","-u","server.py"]
