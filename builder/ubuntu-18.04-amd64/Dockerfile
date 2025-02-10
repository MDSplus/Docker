FROM ubuntu:bionic

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
        libasan0 \
        libblas-dev \
        libcurl4-gnutls-dev \
        libdc1394-22-dev \
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
        libtsan0 \
        libubsan0 \
        libxml2-dev \
        libxt-dev \
        make \
        nano \
        openjdk-8-jdk \
        pkg-config \
        python3-numpy \
        reprepro \
        rsync \
        tar \
        valgrind \
        wget \
        x11proto-print-dev \
        libpython3-dev \
        python3 \
    # CMake
    && wget https://github.com/Kitware/CMake/releases/download/v3.31.2/cmake-3.31.2-linux-x86_64.sh -O /tmp/install-cmake.sh \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local \
    # cleanup
    && apt-get clean \
    && rm -rf /tmp/* \
    && rm -rf ~

CMD [ "/bin/bash" ]
