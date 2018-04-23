FROM python:3.6-alpine

MAINTAINER Tonye Jack <jtonye@ymail.com>

ENV PYTHONUNBUFFERED 1

ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
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
            libstdc++ \
            zlib-dev  \
            musl-dev \
            linux-headers \
            pcre-dev \
            python3-dev \
            # Pillow depenencies
            freetype-dev \
            jpeg-dev \
            lcms2-dev \
            openjpeg-dev \
            tcl-dev \
            tiff-dev \
            tk-dev \
            zlib-dev \
    && update-ca-certificates 2>/dev/null || true \
    && pip3 install -U pip==9.0.3 \
    && LIBRARY_PATH=/lib:/usr/lib /bin/sh -c  "pip3 install --no-cache-dir -r requirements.txt" \
    && apk del .build-deps
