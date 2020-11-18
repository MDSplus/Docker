from ubuntu:precise

RUN apt-get update\
 && apt-get -y upgrade\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -y install\
	automake\
	freetds-dev\
	g++\
	gfortran\
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
	libraw1394-dev\
	libreadline-dev\
	libxml2-dev\
	libxt-dev\
	make\
	openjdk-7-jdk\
	python-dev\
	python-numpy\
	python-setuptools\
	reprepro\
	rsync\
	tar\
	valgrind\
	wget\
	x11proto-print-dev\
 && wget -q --no-check-certificate https://motif.ics.com/sites/default/files/libmotif4_2.3.4-1_amd64.deb\
 && wget -q --no-check-certificate https://motif.ics.com/sites/default/files/libmotif-dev_2.3.4-1_amd64.deb\
 && dpkg -i --force-depends *.deb\
 && apt-get install -y -f\
# cleanup
 && rm *.deb\
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
