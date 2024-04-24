from ubuntu:xenial

RUN export HOME=/tmp && cd ~ && pwd\
 && apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -qq -y install\
	freetds-dev\
	g++\
	gdb\
	gfortran\
	libasan0\
	libblas-dev\
	libcurl4-gnutls-dev\
	libdc1394-22-dev\
	libglobus-callout-dev\
	libglobus-gridmap-callout-error-dev\
	libglobus-gsi-credential-dev\
	libglobus-gsi-proxy-core-dev\
	libglobus-gssapi-gsi-dev\
	libglobus-gss-assist-dev\
	libglobus-xio-gsi-driver-dev\
	libmotif-dev\
	libraw1394-dev\
	libreadline-dev\
	libtest-harness-perl\
	libtsan0\
	libxml2-dev\
	libxt-dev\
	make\
	nano\
	openjdk-8-jdk\
	pkg-config\
	python-dev\
	python-numpy\
	python-pip\
	python-setuptools\
	reprepro\
	rsync\
	tar\
	valgrind\
	x11proto-print-dev\
 && pip install nose tap tap.py\
# cleanup
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
