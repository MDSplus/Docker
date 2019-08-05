from ubuntu:precise

RUN \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get install -y rsync reprepro wget automake make tar valgrind \
      libcurl4-gnutls-dev libreadline-dev python-dev python-setuptools python-numpy\
      libdc1394-22-dev libraw1394-dev \
      libxml2-dev freetds-dev \
      libxt-dev x11proto-print-dev \
      g++ gfortran openjdk-7-jdk \
      libglobus-callout-dev \
      libglobus-gridmap-callout-error-dev \
      libglobus-gsi-credential-dev \
      libglobus-gsi-proxy-core-dev \
      libglobus-gss-assist-dev \
      libglobus-gssapi-gsi-dev \
      libglobus-xio-gsi-driver-dev;

RUN wget --no-check-certificate https://motif.ics.com/sites/default/files/libmotif-dev_2.3.4-1_amd64.deb https://motif.ics.com/sites/default/files/libmotif4_2.3.4-1_amd64.deb

RUN dpkg -i *.deb; \
    apt-get install -y -f
