FROM debian:bookworm

RUN apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -y install\
	autoconf\
	automake\
	bison\
	coz-profiler\
	cvs\
	flex\
	freetds-dev\
	g++\
	gcc\
	gdb\
	gfortran\
	globus-common-progs\
	gperf\
	htop\
	less\
	libblas-dev\
	libcurl4-openssl-dev\
	libdc1394-dev\
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
	libx11-dev\
	libxml2-dev\
	libxmu-dev\
	libxt-dev\
	lsof\
	make\
	nano\
	default-jdk\
	pkg-config\
	python3-nose\
	python3-numpy\
	reprepro\
	rsync\
	sudo\
	valgrind\
	wget\
 && ln -sfT $(which python3) /usr/bin/python\
 && apt-get clean\
 && rm -rf /tmp/*\
 && rm -rf ~
CMD /bin/bash
