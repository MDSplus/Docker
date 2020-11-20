from ubuntu:xenial

RUN export HOME=/tmp && cd ~ && pwd\
 && dpkg --add-architecture i386\
 && apt-get -q update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
# install tools first
 && apt-get -qq -y install\
	gdb\
	make\
	nano\
	pkg-config\
	reprepro\
	rsync\
	tar\
# must be in two steps to prevent dependency conflict
 && apt-get -qq -y install\
	binutils:i386\
	cpp:i386\
	freetds-dev:i386\
	g++-5:i386\
	gcc-5:i386\
	gcc:i386\
	gdb:i386\
	gfortran:i386\
	g++:i386\
	libblas-dev:i386\
	libcurl4-gnutls-dev:i386\
	libdc1394-22-dev:i386\
	libfontconfig1-dev:i386\
	libmotif-dev:i386\
	libpython2.7-dev:i386\
	libraw1394-dev:i386\
	libreadline-dev:i386\
	libssl-dev:i386\
	libxft-dev:i386\
	libxml2-dev:i386\
	openjdk-8-jdk:i386\
	python:i386\
	python-numpy:i386\
	python-setuptools\
# force install dev parts of globus
 && apt-get -qq download\
	globus-common-progs:i386\
	globus-core:i386\
	libglobus-callout-dev:i386\
	libglobus-common?:i386\
	libglobus-common-dev:i386\
	libglobus-gridmap-callout-error?:i386\
	libglobus-gridmap-callout-error-dev:i386\
	libglobus-gsi-callback-dev:i386\
	libglobus-gsi-cert-utils-dev:i386\
	libglobus-gsi-credential-dev:i386\
	libglobus-gsi-openssl-error-dev:i386\
	libglobus-gsi-proxy-core-dev:i386\
	libglobus-gsi-proxy-ssl-dev:i386\
	libglobus-gsi-sysconfig-dev:i386\
	libglobus-gssapi-error?:i386\
	libglobus-gssapi-error-dev:i386\
	libglobus-gssapi-gsi?:i386\
	libglobus-gssapi-gsi-dev:i386\
	libglobus-gss-assist?:i386\
	libglobus-gss-assist-dev:i386\
	libglobus-openssl-module-dev:i386\
	libglobus-xio?:i386\
	libglobus-xio-dev:i386\
	libglobus-xio-gsi-driver-dev:i386\
	libssl-dev:i386\
 && dpkg --install --force-depends *.deb\
# use easy_install from python-setuptools to keep python:i386
 && easy_install pip\
 && pip2 -q install nose tap tap.py\
 && ln -sf /usr/lib/i386-linux-gnu/pkgconfig/*.pc /usr/lib/pkgconfig/\
# cleanup
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
