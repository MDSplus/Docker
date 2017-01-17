from ubuntu:16.04

RUN dpkg --add-architecture i386; \
    apt-get update; \
    apt-get install -y gcc-multilib g++-multilib gfortran-multilib \
      libxml2-dev:amd64 libreadline-dev:amd64 \
      libxml2-dev:i386 libreadline-dev:i386 \
      pkg-config rsync reprepro wget automake make \
      libcurl4-gnutls-dev:i386 openjdk-8-jdk \
      libdc1394-22-dev:i386 libraw1394-dev:i386 \
      freetds-dev:i386 libmotif-dev:i386 libpython2.7-dev:i386 \
      openssh-server gdb:i386 gdbserver:i386 libtest-harness-perl valgrind:i386 \
      python:i386 python-numpy:i386 python-setuptools; \
    easy_install pip; \
    pip2 install nose tap tap.py; \
    ln -sf /usr/bin/uil /usr/bin/uil32;

RUN apt-get download -y globus-common-progs:i386 globus-core:i386 libglobus-callout-dev:i386 \
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
    dpkg --install --force-depends *.deb; \
    rm -f *.deb; \
    ln -sf /usr/lib/i386-linux-gnu/pkgconfig/*.pc /usr/lib/pkgconfig/; \
    apt-get clean

 


