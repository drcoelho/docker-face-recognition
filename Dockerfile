FROM alpine:3.5

MAINTAINER David Coelho <davidrcoelho@gmail.com>

ENV SRC_DIR=/tmp

ADD requirements.txt /tmp

RUN apk update

RUN apk add \
  cmake \
  unzip \
  python-dev \
  py-pip \
  libaio-dev \
  boost \
  boost-dev \
  make \
  ca-certificates \
  openssl \
  make

RUN mkdir -p ${SRC_DIR} \
  && cd ${SRC_DIR} \
  && wget https://github.com/opencv/opencv/archive/3.2.0.zip \
  && unzip 3.2.0.zip \
  && mv opencv-3.2.0 opencv \
  && rm 3.2.0.zip

RUN apk add \
  build-base \
  openblas-dev \
  linux-headers

RUN cd ${SRC_DIR}/opencv \
  && mkdir build \
  && cd build \
  && cmake \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON .. \
  && make -j4 VERBOSE=1 \
  && make install

RUN pip install -r /tmp/requirements.txt
