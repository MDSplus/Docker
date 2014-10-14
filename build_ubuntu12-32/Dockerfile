# Sample dockerfile to build MDSplus for Ubuntu12-32 from scratch
#
# Make a ubuntu12-32 root
#
# On a 32-bit ubuntu12-32 install:
#
# debootstrap precise /mdsplus/docker/roots/ubuntu12-32
# cp /etc/apt/sources.list /mdsplus/docker/roots/ubuntu12-32/etc/apt/
# chroot /mdsplus/docker/roots/ubuntu12-32
# mount /proc
# apt-get update; \
# apt-get install -y autoconf automake cvs gcc gfortran g++ gcc-multilib libreadline-dev \
#    	    	       openjdk-7-jdk wget make rsync sudo pkg-config \
#            	       globus-common-progs libglobus-callout-dev \
#		       libglobus-gridmap-callout-error-dev \
#		       libglobus-gsi-credential-dev \
#		       libglobus-gsi-proxy-core-dev \
#		       libglobus-gss-assist-dev \
#		       libglobus-gssapi-gsi-dev \
#		       libglobus-xio-gsi-driver-dev  \
#		       freetds-dev \
#          	       libmotif-dev libxt-dev libxmu-dev libxp-dev libx11-dev \
#          	       libcurl4-openssl-dev reprepro python-setuptools \
#          	       python-numpy python-pexpect;
#### Install gcc-4.8
#
# apt-get install python-software-properties
# add-apt-repository ppa:ubuntu-toolchain-r/test
# apt-get update
# apt-get install gcc-4.8 gfortran-4.8 g++-4.8
# update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50# apt-get -y upgrade;
# update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-4.8 50
# update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50
# apt-get -y upgrade;
# mkdir /mdsplus
# umount /proc
# exit
# On build system:
# cd /mdsplus/docker/roots/ubuntu12-32
# tar -czf - . | docker import - ubuntu12-32
# 
# To build docker image:
#
#    docker build -t mdsplus:build_ubuntu12-32 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} -v \
#                 /mdsplus:/mdsplus mdsplus:build_ubuntu12-32
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

FROM mdsplus:ubuntu12-32

MAINTAINER Tom Fredian, version: 0.1

ENTRYPOINT apt-key add /mdsplus/dist/mdsplus.gpg.key; \
	   export DIST=Ubuntu12; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/usr/lib/jvm/java-7-openjdk-i386; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   export ARCH=i386; \
	   export CVSROOT=:pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos; \
	   export PYTHON_INCLUDE_DIR=/usr/include/python2.7; \
	   mkdir -p /tmp/deploy; \
           cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy

