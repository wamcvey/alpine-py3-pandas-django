FROM python:3.6-alpine

MAINTAINER Tonye Jack <jtonye@ymail.com>

ENV PYTHONUNBUFFERED 1
ENV LC_ALL C

ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libstdc++ \
        python3-dev \
        bash \
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
        fontconfig \
        git \
    && update-ca-certificates 2>/dev/null || true \
    && mkdir -p /usr/share \
    && cd /usr/share \
    && curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj \
    && ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs \
    && cd /usr/local/share \
    && git clone git://github.com/casperjs/casperjs.git \
    && mv casperjs /opt/ \
    && ln -sf /opt/casperjs/bin/casperjs /usr/local/bin/casperjs \
    && cd / \
    && pip3.6 install -U pip==9.0.3 \
    && pip3.6 install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
