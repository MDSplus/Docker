from debian:stretch
RUN apt-get update;\
    apt-get upgrade -y;\
    apt-get install -y \
	nano gdb wget rsync sudo less htop lsof \
	autoconf automake make pkg-config \
	cvs gcc gfortran g++ valgrind \
	libreadline-dev openjdk-8-jdk \
	globus-common-progs libglobus-callout-dev \
	libglobus-gridmap-callout-error-dev \
	libglobus-gsi-credential-dev \
	libglobus-gsi-proxy-core-dev \
	libglobus-gss-assist-dev \
	libglobus-gssapi-gsi-dev \
	libglobus-xio-gsi-driver-dev  \
	freetds-dev libxml2-dev libcurl4-openssl-dev reprepro \
	libmotif-dev libxt-dev libxmu-dev libx11-dev \
	libdc1394-22-dev libraw1394-dev \
	python-numpy python-nose python3-numpy python3-nose \
	coz-profiler bison flex gperf;
RUN \
	ln -sfT /usr/lib/x86_64-linux-gnu/libpython3.5m.so.1 /usr/lib/x86_64-linux-gnu/libpython3.5.so; \
	ln -sfT $(which python3) $(which python)
