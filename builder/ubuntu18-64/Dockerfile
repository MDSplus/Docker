from ubuntu:18.04

RUN apt-get update;\
    apt-get -y upgrade;\
    apt-get install -y\
      rsync reprepro wget git automake make tar\
      g++ gfortran openjdk-8-jdk\
      python-dev python-setuptools python-numpy python-pip\
      openssh-server\
      gdb gdbserver\
      libasan0 libtsan0 valgrind\
      libtest-harness-perl\
      libcurl4-gnutls-dev libreadline-dev\
      libdc1394-22-dev libraw1394-dev\
      libxml2-dev freetds-dev\
      libmotif-dev libxt-dev x11proto-print-dev\
      libglobus-callout-dev\
      libglobus-gridmap-callout-error-dev\
      libglobus-gsi-credential-dev\
      libglobus-gsi-proxy-core-dev\
      libglobus-gss-assist-dev\
      libglobus-gssapi-gsi-dev\
      libglobus-xio-gsi-driver-dev;
RUN pip install --upgrade setuptools nose tap tap.py;

