# Sample dockerfile to build MDSplus for rhel5 from scratch
#
#
# To build rhel6 image:
#
# yum --installroot=/mdsplus/docker-images/rhel6root install -y yum tcsh redhat-release coreutils wget bind-utils \
#     vim-minimal openssl rhn-client-tools python-setuptools pexpect numpy rsync make automake cvs \
#     sudo readline-devel.* ncurses-devel.* gcc gcc-gfortran gcc-c++ java-1.7.0-openjdk-devel.* openmotif-devel.i386 \
#     curl-devel.* rpm-build tar
# /bin/cp /mdsplus/docker-images/rhel6root/usr/bin/uil /mdsplus/docker-images/rhel6root/usr/bin/uil32
# yum --installroot=/mdsplus/docker-images/rhel6root install -y openmotif-devel.x86_64
# mknod /mdsplus/rhel6root/dev/random c 1 9
# mknod /mdsplus/rhel6root/dev/urandom c 1 9
# cp ~twf/mit-activate /mdsplus/rhel6root/
# chroot /mdsplus/rhel6root
# csh ./mit-activate
##### install epel yum repo using the url of the rpm on the epel website for rhel6 --- needed for globus and freetds pkgs
# yum install -y globus-common-progs globus-callout-devel.* globus-gridmap-callout-error-devel.* \
#		 globus-gsi-credential-devel.* globus-gsi-proxy-core-devel.* \
#		 globus-gss-assist-devel.* globus-gssapi-gsi-devel.* globus-xio-gsi-driver-devel.*  \
#		 freetds-devel.* python26 python26-distribute python26-numpy
# /usr/bin/easy_install-2.6 pexpect
# exit
# On build system:
# cd /mdsplus/docker-images/rhel6root
# tar -czf - . | docker import - rhel6-deploy

FROM rhel6-deploy
# To build docker image:
#
#    docker build -t mdsplus:build_rhel6 .
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

ENTRYPOINT export DIST=el6; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/etc/alternatives/java_sdk_openjdk; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   export CVSROOT=:pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos; \
	   mkdir /tmp/deploy; \
	   cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy
