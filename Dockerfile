FROM ubuntu:16.04

MAINTAINER David Coelho <davidrcoelho@gmail.com>

ADD requirements.txt /tmp

RUN apt-get update

RUN apt-get install -y \
  cmake \
  build-essential \
  unzip \
  python-dev \
  python-pip \
  libaio-dev \
  libboost-all-dev \
  python-opencv \
  libboost-all-dev

RUN apt-get -qq update && \
    pip install -r /tmp/requirements.txt
