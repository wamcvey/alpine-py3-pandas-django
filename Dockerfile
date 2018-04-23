FROM python:3.6-alpine

MAINTAINER Tonye Jack <jtonye@ymail.com>


ENV PYTHONUNBUFFERED 1

ARG PANDAS_VERSION=0.22.0
ARG NUMPY_VERSION=1.14.0


ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libstdc++ \
        python3-dev \
    && apk add --no-cache --virtual .build-deps \
        g++ \
        gcc \
        make \
        libc-dev \
        libffi-dev \
        musl-dev \
        linux-headers \
        pcre-dev \
        && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3.6 install -U pip==9.0.3 \
    && pip3.6 install --no-cache-dir numpy==${NUMPY_VERSION} pandas==${PANDAS_VERSION} -r requirements.txt \
    && apk del .build-deps
