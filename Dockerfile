FROM python:3.7-alpine

# from a fork of:
# https://github.com/jackton1/alpine-python3-numpy-pandas

MAINTAINER William McVey <wam-dockerhub@wamber.net>

ENV PYTHONUNBUFFERED 1
ENV CHROME_BIN /usr/bin/chromium-browser
ENV CHROME_PATH /usr/lib/chromium/

ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libstdc++ \
        python3-dev \
        fontconfig \
    && apk add --no-cache --virtual .build-deps \
        g++ \
        gcc \
        make \
        libc-dev \
        libffi-dev \
        openssl-dev \
        ca-certificates \
        libxml2-dev \
        libxslt-dev \
        libjpeg-turbo-dev \
        zlib-dev  \
        musl-dev \
        linux-headers \
        pcre-dev \
        curl \
        git \
    && update-ca-certificates 2>/dev/null || true \
    && export PATH=$PATH:/usr/lib/chromium-browser \
    && pip3.7 install -U pip~=19.0 \
    && pip3.7 install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
