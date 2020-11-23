from ubuntu:bionic

RUN apt-get update\
 && apt-get -qq -y upgrade\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -qq -y install\
	automake\
	freetds-dev\
	g++\
	gdb\
	gfortran\
	git\
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
	libubsan0\
	libxml2-dev\
	libxt-dev\
	nano\
	make\
	openjdk-8-jdk\
	pkg-config\
	python3-numpy\
	python-dev\
	python-numpy\
	python-pip\
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
