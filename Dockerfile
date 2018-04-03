FROM atlassian/default-image:2

MAINTAINER Tonye Jack <jtonye@ymail.com>

RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    software-properties-common \
    python-software-properties \
    python3.6 && apt-get -y upgrade
RUN apt-get install -y python3 && apt-get install -y python3-pip
RUN pip3 install -U pip && pip3 install -U awscli
RUN wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && bash gitflow-installer.sh install stable; rm gitflow-installer.sh

CMD ["bash"]

ENTRYPOINT ["/bin/sh", "-c"]
