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
            bash \
            zsh \
            ca-certificates \
            openssl \
            wget \
            openssh \
            curl \
    && update-ca-certificates 2>/dev/null || true \
    && python3 -m venv /venv \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && LIBRARY_PATH=/lib:/usr/lib /bin/sh -c  "/venv/bin/pip3 install --no-cache-dir -r requirements.txt" \
    && runDeps="$( \
            scanelf --needed --nobanner --recursive /venv \
                | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                | sort -u \
                | xargs -r apk info --installed \
                | sort -u \
    )" \
    && apk add --virtual .python-rundeps $runDeps \
    && apk del .build-deps
