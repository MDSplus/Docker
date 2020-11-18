from debian:wheezy

RUN echo deb [trusted=yes] http://archive.debian.org/debian wheezy main > /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian wheezy contrib >> /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian wheezy non-free >> /etc/apt/sources.list\
 && echo deb [trusted=yes] http://archive.debian.org/debian-archive/debian-security/ wheezy updates/main >> /etc/apt/sources.list\
 && apt-get update\
 && apt-get -y --force-yes upgrade\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -y --force-yes install\
	automake\
	default-jdk:amd64\
	freetds-dev:amd64\
	gfortran:amd64\
	g++:amd64\
	globus-common-progs:amd64\
	globus-core:amd64\
	libblas-dev:amd64\
	libcurl4-gnutls-dev:amd64\
	libdc1394-22-dev:amd64\
	libglobus-callout0:amd64\
	libglobus-callout-dev:amd64\
	libglobus-common0:amd64\
	libglobus-common-dev:amd64\
	libglobus-gridmap-callout-error0:amd64\
	libglobus-gridmap-callout-error-dev:amd64\
	libglobus-gsi-callback0:amd64\
	libglobus-gsi-callback-dev:amd64\
	libglobus-gsi-cert-utils0:amd64\
	libglobus-gsi-cert-utils-dev:amd64\
	libglobus-gsi-credential1:amd64\
	libglobus-gsi-credential-dev:amd64\
	libglobus-gsi-openssl-error0:amd64\
	libglobus-gsi-openssl-error-dev:amd64\
	libglobus-gsi-proxy-core0:amd64\
	libglobus-gsi-proxy-core-dev:amd64\
	libglobus-gsi-proxy-ssl1:amd64\
	libglobus-gsi-proxy-ssl-dev:amd64\
	libglobus-gsi-sysconfig1:amd64\
	libglobus-gsi-sysconfig-dev:amd64\
	libglobus-gssapi-error2:amd64\
	libglobus-gssapi-error-dev:amd64\
	libglobus-gssapi-gsi4:amd64\
	libglobus-gssapi-gsi-dev:amd64\
	libglobus-gss-assist3:amd64\
	libglobus-gss-assist-dev:amd64\
	libglobus-openssl-module0:amd64\
	libglobus-openssl-module-dev:amd64\
	libglobus-xio0:amd64\
	libglobus-xio-dev:amd64\
	libglobus-xio-gsi-driver0:amd64\
	libglobus-xio-gsi-driver-dev:amd64\
	libmotif-dev:amd64\
	libraw1394-dev:amd64\
	libreadline-dev:amd64\
	libxml2-dev:amd64\
	libxt-dev:amd64\
	make\
	nano\
	python\
	reprepro\
	rsync\
	tar\
	wget\
	x11proto-print-dev:amd64\
 && ln -s /usr/lib/libpython2.7.so.1.0 /usr/lib/libpython2.7.so\
# cleanup
 && apt-get clean\
 && rm -rf /tmp/*\
 && rm -rf ~
CMD /bin/bash
