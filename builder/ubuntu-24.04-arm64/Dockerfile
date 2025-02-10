ARG ARCH=arm64
FROM --platform=linux/${ARCH} arm64v8/ubuntu:noble

ARG CMAKE_VERSION

RUN apt-get update \
    && apt-get -qq -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        bison \
        default-jdk \
        flex \
        freetds-dev \
        g++ \
        gdb \
        gfortran \
        git \
        gperf \
        libasan? \
        libblas-dev \
        libcurl4-gnutls-dev \
        libdc1394-dev \
        libglobus-callout-dev \
        libglobus-gridmap-callout-error-dev \
        libglobus-gsi-credential-dev \
        libglobus-gsi-proxy-core-dev \
        libglobus-gss-assist-dev \
        libglobus-gssapi-gsi-dev \
        libglobus-xio-gsi-driver-dev \
        libmotif-dev \
        libraw1394-dev \
        libreadline-dev \
        libtest-harness-perl \
        libtsan? \
        libubsan? \
        libxml2-dev \
        libxt-dev \
        make \
        nano \
        pkg-config \
        python-is-python3 \
        python3-dev \
        python3-pip \
        python3-numpy \
        reprepro \
        rsync \
        tar \
        valgrind \
        wget \
    # CMake
    && wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-aarch64.sh -O /tmp/install-cmake.sh \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local \
    # Install the latest version of numpy to test against instead of python3-numpy
    && python3 -m pip install numpy --break-system-packages \
    # cleanup
    && rm -rf /tmp/* \
    && apt-get clean

CMD [ "/bin/bash" ]

