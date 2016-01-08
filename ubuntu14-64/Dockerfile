from ubuntu:trusty

RUN echo "deb http://mirrors.kernel.org/ubuntu lucid main multiverse" > /etc/apt/sources.list.d/motif.list; \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get install -y rsync reprepro wget automake make tar valgrind\
      libcurl4-gnutls-dev libreadline-dev python-dev python-setuptools python-numpy\
      libdc1394-22-dev libraw1394-dev \
      libxml2-dev freetds-dev \
      libmotif-dev libxt-dev x11proto-print-dev \
      g++ gfortran openjdk-7-jdk \
      libglobus-callout-dev \
      libglobus-gridmap-callout-error-dev \
      libglobus-gsi-credential-dev \
      libglobus-gsi-proxy-core-dev \
      libglobus-gss-assist-dev \
      libglobus-gssapi-gsi-dev \
      libglobus-xio-gsi-driver-dev;

RUN apt-get install -y \
      openssh-server \
      gdb gdbserver \
      libtest-harness-perl \
      valgrind;
