FROM atlassian/default-image:2

MAINTAINER Tonye Jack

RUN apt-get update && add-apt-repository ppa:deadsnakes/ppa && apt-get install -y --no-install-recommends \
                          python3.6 \
                              jq \
                            
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py && pip install --upgrade pip && pip install awscli
