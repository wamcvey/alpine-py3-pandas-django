FROM python:3.6-alpine

MAINTAINER Tonye Jack <jtonye@ymail.com>

ENV PYTHONUNBUFFERED 1
ENV LC_ALL C
ENV PHANTOMJS_ARCHIVE phantomjs.tar.gz

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
    && curl -Lk -o $PHANTOMJS_ARCHIVE https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
	&& tar -xf $PHANTOMJS_ARCHIVE -C /tmp/ \
	&& cp -R /tmp/etc/fonts /etc/ \
	&& cp -R /tmp/lib/* /lib/ \
	&& cp -R /tmp/lib64 / \
	&& cp -R /tmp/usr/lib/* /usr/lib/ \
	&& cp -R /tmp/usr/lib/x86_64-linux-gnu /usr/ \
	&& cp -R /tmp/usr/share/* /usr/share/ \
	&& cp /tmp/usr/local/bin/phantomjs /usr/bin/ \
	&& rm -fr $PHANTOMJS_ARCHIVE  /tmp/* \
    && cd /usr/local/share \
    && git clone git://github.com/casperjs/casperjs.git \
    && ln -sf /usr/local/share/casperjs/bin/casperjs /usr/local/bin/casperjs \
    && cd / \
    && pip3.6 install -U pip==9.0.3 \
    && pip3.6 install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
