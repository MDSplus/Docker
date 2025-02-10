FROM debian:bookworm

ARG CMAKE_VERSION

RUN apt-get update \
    && apt-get -qq -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        bison\
        coz-profiler\
        cvs\
        flex\
        freetds-dev\
        g++\
        gcc\
        gdb\
        gfortran\
        git\
        globus-common-progs\
        gperf\
        htop\
        less\
        libblas-dev\
        libcurl4-openssl-dev\
        libdc1394-dev\
        libglobus-callout-dev\
        libglobus-gridmap-callout-error-dev\
        libglobus-gsi-credential-dev\
        libglobus-gsi-proxy-core-dev\
        libglobus-gssapi-gsi-dev\
        libglobus-gss-assist-dev\
        libglobus-xio-gsi-driver-dev\
        libmotif-dev\
        libraw1394-dev\
        libreadline-dev\
        libx11-dev\
        libxml2-dev\
        libxmu-dev\
        libxt-dev\
        lsof\
        make\
        nano\
        default-jdk\
        pkg-config\
        python3-dev\
        python3-nose\
        python3-numpy\
        reprepro\
        rsync\
        sudo\
        valgrind\
        wget\
    && ln -sfT $(which python3) /usr/bin/python\
    # CMake
    && wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.sh -O /tmp/install-cmake.sh \
    && sh /tmp/install-cmake.sh --skip-license --prefix=/usr/local\
    # cleanup
    && apt-get clean\
    && rm -rf /tmp/*\
    && rm -rf ~

CMD [ "/bin/bash" ]
