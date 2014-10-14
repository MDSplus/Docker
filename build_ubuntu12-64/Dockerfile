# Sample dockerfile to build MDSplus for Ubuntu12-64 from scratch
#### First explort a ubuntu:12.04 image.
#### copy /etc/resolv.conf to root/etc so you can do dns lookups.
#### chroot to it and do the following:
# echo "deb http://mirrors.kernel.org/ubuntu lucid main multiverse" \
#    	 > /etc/apt/sources.list.d/motif.list;\
#    apt-get update; \
#    apt-get install -y autoconf automake cvs gcc gfortran g++ libreadline-dev \
#    	    	       openjdk-7-jdk wget make rsync sudo pkg-config \
#            	       globus-common-progs libglobus-callout-dev \
#		       libglobus-gridmap-callout-error-dev \
#		       libglobus-gsi-credential-dev \
#		       libglobus-gsi-proxy-core-dev \
#		       libglobus-gss-assist-dev \
#		       libglobus-gssapi-gsi-dev \
#		       libglobus-xio-gsi-driver-dev  \
#		       freetds-dev \
#         	       libmotif-dev libxt-dev libxmu-dev libxp-dev libx11-dev \
#          	       libcurl4-openssl-dev reprepro python-setuptools \
#          	       python-numpy python-pexpect python-dev;
# mdir /mdsplus
# Make a image from this root:
#
# cd ubuntu12-64
# tar zcf - . | docker import - mdsplus ubuntu12-64
#
FROM mdsplus:ubuntu12-64
# To build docker image:
#
#    docker build -t mdsplus:build_ubuntu12-64 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} -v \
#                 /mdsplus:/mdsplus mdsplus:build_ubuntu12-64
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

MAINTAINER Tom Fredian, version: 0.1

ENTRYPOINT apt-key add /mdsplus/dist/mdsplus.gpg.key; \
	   export DIST=Ubuntu12; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/usr/lib/jvm/java-7-openjdk-amd64; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   export CVSROOT=:pserver:MDSguest:MDSguest@www.mdsplus.org/mdsplus/repos; \
	   export PYTHON_INCLUDE_DIR=/usr/include/python2.7; \
	   mkdir -p /tmp/deploy; \
           cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy
