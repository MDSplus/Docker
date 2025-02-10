FROM debian:buster

RUN apt-get update \
    && apt-get -qq -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        bison \
        coz-profiler \
        cvs \
        default-jdk \
        flex \
        freetds-dev \
        g++ \
        gcc \
        gdb \
        gfortran \
        git \
        globus-common-progs \
        gperf \
        htop \
        less \
        libblas-dev \
        libcurl4-openssl-dev \
        libdc1394-22-dev \
        libglobus-callout-dev \
        libglobus-gridmap-callout-error-dev \
        libglobus-gsi-credential-dev \
        libglobus-gsi-proxy-core-dev \
        libglobus-gss-assist-dev \
        libglobus-gssapi-gsi-dev \
        libglobus-xio-gsi-driver-dev \
        libmotif-dev \
        libpython3-dev \
        libraw1394-dev \
        libreadline-dev \
        libx11-dev \
        libxml2-dev \
        libxmu-dev \
        libxt-dev \
        lsof \
        make \
        nano \
        pkg-config \
        python3 \
        python3-dev \
        python3-numpy \
        reprepro \
        rsync \
        sudo \
        valgrind \
        wget \
    && ln -sfT $(which python3) $(which python) \
    # CMake
    && wget https://github.com/Kitware/CMake/releases/download/v3.31.2/cmake-3.31.2-linux-x86_64.sh -O /tmp/install-cmake.sh  \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local  \
    # cleanup
    && apt-get clean \
    && rm -rf /tmp/* \
    && rm -rf ~

CMD [ "/bin/bash" ]
