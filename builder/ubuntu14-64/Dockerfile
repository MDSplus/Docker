from ubuntu:trusty

RUN apt-get -q update\
 && apt-get -qq -y upgrade\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -qq -y install\
	automake\
	freetds-dev\
	g++\
	gdb\
	gdbserver\
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
	openjdk-7-jdk\
	openssh-server\
	python-dev\
	python-numpy\
	python-setuptools\
	reprepro\
	rsync\
	tar\
	valgrind\
	wget\
	x11proto-print-dev\
 && easy_install-2.7 pip\
 && pip install --upgrade setuptools nose tap tap.py\
# cleanup
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
