from ubuntu:trusty

ENV arch=amd64

RUN echo "deb http://mirrors.kernel.org/ubuntu lucid main multiverse" > /etc/apt/sources.list.d/motif.list; \
    apt-get update; \
    apt-get -y upgrade; \
    if [ "${arch}" = "i386" ] ; then apt-get remove -y python python-dev; fi;\
    apt-get install -y wget\
      rsync pkg-config reprepro \
      automake make git \
      tar \
      libcurl4-gnutls-dev:${arch} libreadline-dev:${arch} python-dev:${arch}\
      libdc1394-22-dev:${arch} libraw1394-dev:${arch} \
      libxml2-dev:${arch} \
      libmotif-dev:${arch} libxt-dev:${arch} x11proto-print-dev:${arch} \
      g++:${arch} gfortran:${arch}; \
    if [ "${arch}" = "amd64" ] ; then \
        apt-get install -y libglobus-callout-dev:${arch} \
        libglobus-gridmap-callout-error-dev:${arch} \
        libglobus-gsi-credential-dev:${arch} \
        libglobus-gsi-proxy-core-dev:${arch} \
        libglobus-gss-assist-dev:${arch} \
        libglobus-gssapi-gsi-dev:${arch} \
        libglobus-xio-gsi-driver-dev:${arch}; \
    fi; \
    if [ "${arch}" = "i386" ] ; then apt-get install -y python; fi; \
    wget -O - http://github.com/MDSplus/mdsplus/archive/alpha.tar.gz | tar zxvf -; \
    cd mdsplus-alpha; \
    ./configure --disable-java --host=${arch}-linux; \
    make
#    apt-get install -y wget python-setuptools python-pexpect python-numpy \

