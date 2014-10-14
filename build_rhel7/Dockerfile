# Sample dockerfile to build MDSplus for rhel7 from scratch
#
#
# To build rhel7 image:
#
# yum --installroot=/mdsplus/docker/roots/rhel7 install -y yum tcsh redhat-release coreutils wget bind-utils \
#     vim-minimal openssl rhn-client-tools python-setuptools pexpect numpy rsync make automake cvs \
#     sudo which readline-devel readline-devel.i686 gcc gcc-gfortran gcc-c++ \
#     java-*-openjdk-devel java-*-openjdk-devel.i686 motif-devel.i686 \
#     curl-devel curl-devel.i686 rpm-build tar
# /bin/cp /mdsplus/docker/roots/rhel7/usr/bin/uil /mdsplus/docker/roots/rhel7/usr/bin/uil32
# yum --installroot=/mdsplus/docker/roots/rhel7 install -y motif-devel.x86_64
# mknod /mdsplus/rhel7/dev/random c 1 9
# mknod /mdsplus/rhel7/dev/urandom c 1 9
# cp ~twf/mit-activate /mdsplus/rhel7/
# chroot /mdsplus/rhel7
# csh ./mit-activate
##### install epel yum repo using the url of the rpm on the epel website for rhel7 --- needed for globus and freetds pkgs
# yum install -y globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686 \
#                globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
#		 freetds-devel freetds-devel.i686
##### because there is currently no i686 packages in EPEL for rhel7 it was necessary to try building mdsplus using chroot,
##### checking out mdsplus in /tmp and doing 32-bit builds seeing what breaks and copy includes and libs from rhel6 until
##### mdsplus builds.
# exit
# On build system:
# cd /mdsplus/docker/roots/rhel7
# tar -czf - . | docker import - mdsplus rhel7

FROM mdsplus:rhel7
# To build docker image:
#
#    docker build -t mdsplus:build_rhel7 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} \
#                          -v /mdsplus:/mdsplus mdsplus:${JOB_NAME}
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

MAINTAINER Tom Fredian, version: 0.1

ENTRYPOINT export DIST=el7; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/etc/alternatives/java_sdk_openjdk; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   export CVSROOT=:pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos; \
	   export PYTHON_INCLUDE_DIR=/usr/include/python2.7; \
	   mkdir /tmp/deploy; \
	   cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy
