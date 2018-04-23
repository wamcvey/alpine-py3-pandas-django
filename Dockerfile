FROM alpine:3.7

MAINTAINER Tonye Jack <jtonye@ymail.com>

ENV PYTHONUNBUFFERED 1

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
            jq \
            git \
            nodejs \
            nodejs-npm \
            python3-dev \
    && update-ca-certificates 2>/dev/null || true \
    && python3 -m venv /venv \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && LIBRARY_PATH=/lib:/usr/lib /bin/zsh -c  "/venv/bin/pip3 install -U awscli" \
    && runDeps="$( \
            scanelf --needed --nobanner --recursive /venv \
                | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                | sort -u \
                | xargs -r apk info --installed \
                | sort -u \
    )" \
    && apk add --virtual .python-rundeps $runDeps \
    && curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh \
    && chmod +x gitflow-installer.sh \
    && ./gitflow-installer.sh
