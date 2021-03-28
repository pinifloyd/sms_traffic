FROM ruby:3.0.0 as develop

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ARG DOCKER_IMAGE_APP_PATH=${DOCKER_IMAGE_APP_PATH}
ENV DOCKER_IMAGE_APP_PATH=${DOCKER_IMAGE_APP_PATH}

WORKDIR ${DOCKER_IMAGE_APP_PATH}

RUN apt-get update -qq && \
    apt-get install --allow-unauthenticated -y \
    vim bash

COPY ./ ./

RUN gem install bundler -v 2.2 && \
    GIT_SSL_NO_VERIFY=true bundle install
