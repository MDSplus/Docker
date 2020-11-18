from debian:wheezy

# does not build anymore for i386
RUN echo deb [trusted=yes] http://archive.debian.org/debian wheezy main > /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian wheezy contrib >> /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian wheezy non-free >> /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian-archive/debian-security/ wheezy updates/main >> /etc/apt/sources.list\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get update\
 && apt-get -y --force-yes upgrade\

 && apt-get install -y --force-yes\
	automake\
	default-jdk:i386\
	freetds-dev:i386\
	gfortran:i386\
	g++:i386\
	globus-common-progs:i386\
	globus-core:i386\
	libblas-dev:i386\
	libcurl4-gnutls-dev:i386\
	libdc1394-22-dev:i386\
	libglobus-callout0:i386\
	libglobus-callout-dev:i386\
	libglobus-common0:i386\
	libglobus-common-dev:i386\
	libglobus-gridmap-callout-error0:i386\
	libglobus-gridmap-callout-error-dev:i386\
	libglobus-gsi-callback0:i386\
	libglobus-gsi-callback-dev:i386\
	libglobus-gsi-cert-utils0:i386\
	libglobus-gsi-cert-utils-dev:i386\
	libglobus-gsi-credential1:i386\
	libglobus-gsi-credential-dev:i386\
	libglobus-gsi-openssl-error0:i386\
	libglobus-gsi-openssl-error-dev:i386\
	libglobus-gsi-proxy-core0:i386\
	libglobus-gsi-proxy-core-dev:i386\
	libglobus-gsi-proxy-ssl1:i386\
	libglobus-gsi-proxy-ssl-dev:i386\
	libglobus-gsi-sysconfig1:i386\
	libglobus-gsi-sysconfig-dev:i386\
	libglobus-gssapi-error2:i386\
	libglobus-gssapi-error-dev:i386\
	libglobus-gssapi-gsi4:i386\
	libglobus-gssapi-gsi-dev:i386\
	libglobus-gss-assist3:i386\
	libglobus-gss-assist-dev:i386\
	libglobus-openssl-module0:i386\
	libglobus-openssl-module-dev:i386\
	libglobus-xio0:i386\
	libglobus-xio-dev:i386\
	libglobus-xio-gsi-driver0:i386\
	libglobus-xio-gsi-driver-dev:i386\
	libmotif-dev:i386\
	libraw1394-dev:i386\
	libreadline-dev:i386\
	libxml2-dev:i386\
	libxt-dev:i386\
	make\
	nano\
	python\
	reprepro\
	rsync\
	tar\
	wget\
	x11proto-print-dev:i386\
 && mv /usr/bin/uil /usr/bin/uil32\
 && ln -sf /usr/lib/i386-linux-gnu/pkgconfig/*.pc /usr/lib/pkgconfig/\
# cleanup
 && apt-get clean\
 && rm -rf /tmp/*\
 && rm -rf ~
COPY openssl.pc /usr/lib/pkgconfig/
CMD /bin/bash
