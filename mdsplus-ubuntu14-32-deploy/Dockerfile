# Sample dockerfile to build MDSplus for Ubuntu14-32 from scratch
#
# Make a ubuntu14-32 root
#
# On a 32-bit ubuntu14-32 install:
#
# debootstrap precise /mdsplus/docker-images/ubuntu14-32root
# cp /etc/apt/sources.list /mdsplus/docker-images/ubuntu14-32root/etc/apt/
# chroot /mdsplus/docker-images/ubuntu14-32root
# tar zxf -C /mdsplus/certs/rpm-signing-keys.tgz /mdsplus/docker-images/ubuntu14-32root/root
# chown -R root:root /mdsplus/docker-images/ubuntu14-32root/root/.gnupg
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
# apt-get -y upgrade;
# mkdir /mdsplus
# umount /proc
# exit
# On build system:
# cd /mdsplus/docker-images/ubuntu14-32root
# tar -czf - . | docker import - ubuntu14-32-deploy
# 
# To build docker image:
#
#    docker build -t mdsplus:build_ubuntu14-32 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} -v \
#                 /mdsplus:/mdsplus mdsplus:build_ubuntu14-32
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

FROM ubuntu14-32-deploy

MAINTAINER Tom Fredian, version: 0.1

ENTRYPOINT apt-key add /mdsplus/dist/mdsplus.gpg.key; \
	   export DIST=Ubuntu14; \
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
	   mkdir -p /tmp/deploy; \
           cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy

