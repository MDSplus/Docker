FROM debian:stretch

RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list\
 && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list\
 && apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apt-get -y install\
	autoconf\
	automake\
	bash\
	bison\
	coz-profiler\
	cvs\
	default-jdk\
	flex\
	freetds-dev\
	g++\
	gcc\
	gdb\
	gfortran\
	git\
	globus-common-progs\
	gperf\
	htop\
	less\
	libblas-dev\
	libcurl4-openssl-dev\
	libdc1394-22-dev\
	libglobus-callout-dev\
	libglobus-gridmap-callout-error-dev\
	libglobus-gsi-credential-dev\
	libglobus-gsi-proxy-core-dev\
	libglobus-gss-assist-dev\
	libglobus-gssapi-gsi-dev\
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
	pkg-config\
	python-nose\
	python-numpy\
	python\
	python3-nose\
	python3-numpy\
	reprepro\
	rsync\
	sudo\
	valgrind\
	wget\
 && ln -sfT /usr/lib/x86_64-linux-gnu/libpython3.5m.so.1 /usr/lib/x86_64-linux-gnu/libpython3.5.so\
 && ln -sfT $(which python3) $(which python)\
 && apt-get clean\
 && rm -rf /tmp/*\
 && rm -rf ~
CMD /bin/bash
