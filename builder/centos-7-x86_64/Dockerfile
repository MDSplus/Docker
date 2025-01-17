FROM centos:7

COPY ./CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum install -y epel-release \
    && yum clean all \
    && yum install -y \
        binutils \
        bison \
        blas-devel\
        flex \
        freetds-devel \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        git \
        glibc-devel \
        globus-callout-devel \
        globus-common-progs \
        globus-gridmap-callout-error-devel \
        globus-gsi-credential-devel \
        globus-gsi-proxy-core-devel  \
        globus-gss-assist-devel \
        globus-gssapi-gsi-devel \
        globus-xio-gsi-driver-devel \
        gperf \
        hdf5-devel \
        java-devel \
        libcurl-devel \
        libdc1394-devel \
        libgfortran \
        libquadmath-devel \
        libraw1394-devel \
        libstdc++-devel \ 
        libX11-devel \
        libxml2-devel \
        make \
        openmotif-devel \ 
        python3-devel \
        python3-numpy \
        readline-devel \
        rpm-build \
        rsync \
        tar \
        wget \
        which \
        yum-utils \
    # cmake
    && wget https://github.com/Kitware/CMake/releases/download/v3.31.2/cmake-3.31.2-linux-x86_64.sh -O /tmp/install-cmake.sh \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local \
    # cleanup
    && rm -rf ~ \
    && rm -rf /tmp/* \
    && yum clean all

CMD [ "/bin/bash" ]