FROM atlassian/default-image:2

MAINTAINER Tonye Jack

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6 \
    jq

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3.6 get-pip.py && pip3 install --upgrade pip && pip3 install awscli
RUN wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && bash gitflow-installer.sh install stable; rm gitflow-installer.sh
