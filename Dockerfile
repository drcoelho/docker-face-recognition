FROM bamos/openface:0.2.1

MAINTAINER David Coelho <davidrcoelho@gmail.com>

ADD requirements.txt /tmp

RUN apt-get -qq update && \
    apt-get -y install build-essential unzip python-dev libaio-dev && \
    pip install -r /tmp/requirements.txt
