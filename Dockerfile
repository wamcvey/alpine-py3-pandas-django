FROM atlassian/default-image:2

MAINTAINER Tonye Jack <jtonye@ymail.com>

RUN add-apt-repository ppa:jonathonf/python-3.6
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    jq \
    software-properties-common \
    python-software-properties \
    python3.6-dev \
    python3.6-venv \
    && apt-get -y upgrade
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN pip3.6 install -U awscli numpy pandas

RUN wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh \
    && bash gitflow-installer.sh install stable; rm gitflow-installer.sh
