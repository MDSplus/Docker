from ubuntu:trusty

RUN echo "deb http://mirrors.kernel.org/ubuntu lucid main multiverse" > /etc/apt/sources.list.d/motif.list; \
    apt-get update; \
    apt-get -y upgrade; \
    apt-get install -y rsync reprepro wget automake make tar \
      libcurl4-gnutls-dev:i386 libreadline-dev:i386 \
      libdc1394-22-dev:i386 libraw1394-dev:i386 \
      libxml2-dev:i386 freetds-dev:i386 \
      libmotif-dev:i386 libxt-dev:i386 x11proto-print-dev:i386 \
      g++:i386 gfortran:i386 openjdk-7-jdk:i386; \
    mv /usr/bin/uil /usr/bin/uil32; \
    apt-get download python2.7:i386 python2.7-dev:i386 python2.7-minimal:i386 \
      globus-common-progs:i386 globus-core:i386 libglobus-callout-dev:i386 \
      libglobus-callout0:i386 \
      libglobus-common-dev:i386 \
      libglobus-common0:i386 \
      libglobus-gridmap-callout-error-dev:i386 \
      libglobus-gridmap-callout-error0:i386 \
      libglobus-gsi-callback-dev:i386 \
      libglobus-gsi-callback0:i386 \
      libglobus-gsi-cert-utils-dev:i386 \
      libglobus-gsi-cert-utils0:i386 \
      libglobus-gsi-credential-dev:i386 \
      libglobus-gsi-credential1:i386 \
      libglobus-gsi-openssl-error-dev:i386 \
      libglobus-gsi-openssl-error0:i386 \
      libglobus-gsi-proxy-core-dev:i386 \
      libglobus-gsi-proxy-core0:i386 \
      libglobus-gsi-proxy-ssl-dev:i386 \
      libglobus-gsi-proxy-ssl1:i386 \
      libglobus-gsi-sysconfig-dev:i386 \
      libglobus-gsi-sysconfig1:i386 \
      libglobus-gss-assist-dev:i386 \
      libglobus-gss-assist3:i386 \
      libglobus-gssapi-error-dev:i386 \
      libglobus-gssapi-error2:i386 \
      libglobus-gssapi-gsi-dev:i386 \
      libglobus-gssapi-gsi4:i386 \
      libglobus-openssl-module-dev:i386 \
      libglobus-openssl-module0:i386 \
      libglobus-xio-dev:i386 \
      libglobus-xio-gsi-driver-dev:i386 \
      libglobus-xio-gsi-driver0:i386 \
      libglobus-xio0:i386; \
    for deb in *.deb; do dpkg-deb -xv ${deb} /; done

