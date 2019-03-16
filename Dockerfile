FROM python:3.7-alpine

# from a fork of:
# https://github.com/jackton1/alpine-python3-numpy-pandas

MAINTAINER William McVey <wam-dockerhub@wamber.net>

ENV PYTHONUNBUFFERED 1

ADD requirements.txt /requirements.txt

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        libstdc++ \
        python3-dev \
	gettext \
	postgresql-client \
	jpeg openjpeg zlib freetype lcms2 tiff tk tcl \
	# Useful utilities
	git curl fontconfig \
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
        postgresql-dev \
	# Pillow dependencies
	jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev \
	tk-dev tcl-dev \
    && update-ca-certificates 2>/dev/null || true \
    && pip3.7 install -U pip~=19.0 \
    && pip3.7 install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
