FROM ubuntu:jammy

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
        python3-numpy \
        python3-pip \
        reprepro \
        rsync \
        tar \
        valgrind \
        wget \
    && ln -sf python3 /usr/bin/python \
    # CMake
    && wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.sh -O /tmp/install-cmake.sh \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local \
    # cleanup
    && apt-get clean \
    && rm -rf /tmp/* \
    && rm -rf ~

CMD [ "/bin/bash" ]


