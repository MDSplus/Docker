from ubuntu:noble

RUN apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install\
	automake\
	freetds-dev\
	g++\
	gdb\
	gfortran\
	git\
	libasan?\
	libblas-dev\
	libcurl4-gnutls-dev\
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
	libtest-harness-perl\
	libtsan?\
	libubsan?\
	libxml2-dev\
	libxt-dev\
	nano\
	make\
	default-jdk\
	pkg-config\
	python3-numpy\
	python3-nose\	
	reprepro\
	rsync\
	tar\
	valgrind\
 && ln -sf python3 /usr/bin/python\
# cleanup
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
