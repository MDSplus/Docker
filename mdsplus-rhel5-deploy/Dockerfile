# Sample dockerfile to build MDSplus for rhel5 from scratch
#
#
# To build rhel5 image:
#
# yum --installroot=/mdsplus/rhel5root install -y yum tcsh redhat-release coreutils wget bind-utils \
#     vim-minimal openssl rhn-client-tools python-setuptools pexpect numpy rsync make automake cvs \
#     sudo readline-devel.* gcc gcc-gfortran gcc-c++ java-1.7.0-openjdk-devel.* openmotif-devel.* \
#     curl-devel.* rpm-build
# mkdir /mdsplus/rhel5root/dev/random c 1 9
# mkdir /mdsplus/rhel5root/dev/urandom c 1 9
# cp ~twf/mit-activate /mdsplus/rhel5root/
# chroot /mdsplus/rhel5root
# csh ./mit-activate
##### install epel using the url of the rpm on the epel website for rhel5 --- needed for globus and freetds pkgs
# yum install -y globus-common-progs globus-callout-devel.* globus-gridmap-callout-error-devel.* \
#		 globus-gsi-credential-devel.* globus-gsi-proxy-core-devel.* \
#		 globus-gss-assist-devel.* globus-gssapi-gsi-devel.* globus-xio-gsi-driver-devel.*  \
#		 freetds-devel.* python26 python26-distribute python26-numpy
# /usr/bin/easy_install-2.6 pexpect
# exit
# On build system:
# cd /mdsplus/rhel5root
# tar -czf - . | docker import - rhel5

FROM rhel5
# To build docker image:
#
#    docker build -t mdsplus:buildRhel5 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} \
#                          -v /mdsplus:/mdsplus mdsplus:buildRhel5
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

MAINTAINER Tom Fredian, version: 0.1

RUN yum -y update; \
    mkdir /mdsplus
WORKDIR /tmp
RUN cvs -d :pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos co deploy;
WORKDIR /tmp/deploy
ENTRYPOINT cvs -q update -d; \
	   export DIST=el5; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/etc/alternatives/java_sdk_openjdk; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   python26 release.py deploy
