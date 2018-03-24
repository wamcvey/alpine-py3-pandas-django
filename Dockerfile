FROM atlassian/default-image:2

MAINTAINER Tonye Jack

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6 \
    jq

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3.6 get-pip.py && pip install --upgrade pip && pip install awscli
