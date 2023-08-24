from rockylinux:9.1


RUN dnf -q -y install epel-release dnf-plugins-core \
 && dnf -q -y update \
# (SLW) --enablerepo=resilientstorage is needed for libtool-ltdl-devel which is needed for globus-*-devel
 && dnf -q -y install --enablerepo=resilientstorage \
	automake \
	binutils \
	bison \
	blas \
	createrepo \
	flex\
	freetds-devel \
	gcc \
	gcc-c++ \
	gcc-gfortran \
	gdb \
	gdb-gdbserver \
	git \
	globus-callout-devel \
	globus-common-progs \
	globus-gridmap-callout-error-devel \
	globus-gsi-credential-devel \
	globus-gsi-proxy-core-devel \
	globus-gssapi-gsi-devel \
	globus-gss-assist-devel \
	globus-xio-gsi-driver-devel \
	gperf \
	hdf5 \
	hdf5-devel \
	java-11-openjdk-devel \
    tzdata-java \
	libasan \
	libcurl-devel \
	libdc1394 \
    libdc1394-devel \
	libraw1394-devel \
	libraw1394 \
	libtsan \
	libX11-devel \
	libxml2 \
	libxml2-devel \
	make \
	maven \
	motif-devel \
	openssh \
	openssh-server \
	perl-Test-Harness.noarch \
	platform-python-setuptools \
# (SLW) python-unversioned-command creates the symlink /usr/bin/python -> python3
	python-unversioned-command \
	python3-libs \
	python3-numpy \
	python3-pexpect \
	readline-devel \
	rpm-build \
	rpm-sign \
	rsync \
	tar \
	valgrind \
	wget \
	which \
	dnf-utils \
# cleanup
 && rm -rf ~ \
 && rm -rf /tmp/* \
 && dnf clean all
CMD /bin/bash
