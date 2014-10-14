# Sample dockerfile to build MDSplus for rhel5 from scratch
#
#
# To build rhel5 image:
#
# yum --installroot=/mdsplus/docker/roots/rhel5 install -y yum tcsh redhat-release coreutils wget rpm-build
# cp /mdsplus/dist/mdsplus.gpg.key /mdsplus/docker/roots/rhel5/
# cp ~twf/mit-activate /mdsplus/docker/roots/rhel5/
# pushd /mdsplus/docker/roots/rhel5/root; tar zxf /mdsplus/certs/rpm-signing-keys.tgz; chown -R root:root .gnupg; popd
# chroot /mdsplus/rhel5
# export PATH=/bin:$PATH ### not sure why /bin isn't in path
# mknod /dev/random c 1 9
# mknod /dev/urandom c 1 9
# mount -t proc proc /proc
# csh ./mit-activate
# yum install wget bind-utils \
#     vim-minimal openssl rhn-client-tools python-setuptools pexpect which numpy rsync make automake cvs \
#     sudo readline-devel readline-devel.i386 ncurses-devel ncurses-devel.i386 gcc gcc-gfortran gcc-c++ \
#     java-1.6.0-openjdk-devel openmotif-devel.i386 \
#     curl-devel curl-devel.i386 rpm-build repocreate
# cp /bin/uil /bin/uil32
# yum install -y openmotif-devel.x86_64
##### install epel yum repo using the url of the rpm on the epel website for rhel5 --- needed for globus and freetds pkgs
# yum install -y globus-xio-gsi-driver-devel globus-xio-devel.i386 globus-xio-gsi-driver-devel.i386 \
#                globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
#		 freetds-devel freetds-devel.i686 python26 python26-distribute python26-numpy \
#                devtoolset-1.1* devtoolset-1.1*.i686
# /usr/bin/easy_install-2.6 pexpect
# rpm --import /mdsplus.gpg.key
# umount /proc
# exit
# On build system:
# cd /mdsplus/docker/roots/rhel5
# tar -czf - . | docker import - mdsplus rhel5

FROM mdsplus:rhel5
# To build docker image:
#
#    docker build -t mdsplus:build_rhel5 .
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

ENTRYPOINT export DIST=el5; \
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
	   scl enable devtoolset-1.1 'python26 /mdsplus/deploy/release.py deploy'
