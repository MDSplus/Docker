from ubuntu:18.04

RUN dpkg --add-architecture i386\
 && apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -y install\
	automake\
	freetds-dev:i386\
	gcc-multilib\
	gdb:i386\
	gdbserver:i386\
	gfortran-multilib\
	git\
	g++-multilib\
	libblas-dev:i386\
	libcurl4-gnutls-dev:i386\
	libdc1394-22-dev:i386\
	libmotif-dev:i386\
	libpython2.7-dev:i386\
	libraw1394-dev:i386\
	libreadline-dev:i386\
	libssl-dev:i386\
	libtest-harness-perl\
	libxml2-dev:i386\
	make\
	openjdk-8-jdk\
	openssh-server\
	pkg-config\
	python:i386\
	python-numpy:i386\
	python-setuptools\
	reprepro\
	rsync\
	valgrind:i386\
	wget\
 && apt-get -y install python-pip\
 && pip2 install nose tap tap.py\
 && apt-get download\
	globus-common-progs:i386\
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
	libglobus-xio-gsi-driver-dev:i386\
 && dpkg --install --force-depends *.deb\
 && apt-get -y install -f\
 && ln -sf /usr/bin/uil /usr/bin/uil32\
 && ln -sf /usr/lib/i386-linux-gnu/pkgconfig/*.pc /usr/lib/pkgconfig/\
# cleanup
 && rm *.deb\
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
