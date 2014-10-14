# Sample dockerfile to build MDSplus for fc20 from scratch
#
#
# To build fc20 image:
#
# yum --installroot=/mdsplus/docker/roots/fc20 --releasever=20 install -y --nogpgcheck fedora-release coreutils yum\
#     tcsh which wget bind-utils vim-minimal openssl python-setuptools pexpect numpy rsync make automake cvs \
#     sudo rpm-sign createrepo yum-utils autoconf \ 
#     readline-devel readline-devel.i686 gcc glibc-devel glibc-devel.i686 gcc-gfortran gcc-gfortran.i686 \
#     gcc-c++ gcc-c++.i686 java-1.8.0-openjdk-devel libcurl-devel libcurl-devel.i686 rpm-build \
#     globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686 \
#     globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
#     freetds-devel freetds-devel.i686 hdf5-devel hdf5.i686 python-devel \
#     motif-devel.i686 libSM-devel.i686 libICE-devel.i686 libX11-devel.i686
##################
# if using for mingw builds add the following packages:
#     'mingw*-gcc-*' 'mingw*-readline' 'mingw*-dlfcn*' 'mingw*-readline*' 'mingw32-nsis*' binutils
##################
# mknod /mdsplus/docker/roots/fc20/dev/random c 1 9
# mknod /mdsplus/docker/roots/fc20/dev/urandom c 1 9
# tar -zxf -C /mdsplus/certs/rpm-signing-keys.tgz /mdsplus/docker/roots/fc20/root/
# chown -R root:root /mdsplus/docker/roots/fc20/root/.gnupg
# cp /mdsplus/dist/mdsplus.gpg.key /mdsplus/docker/roots/fc20/
# chroot /mdsplus/docker/roots/fc20
#### hdf5 has a problem installing both the 32-bit and 64-bit rpms so this is the workaround
# yumdownloader hdf5-devel.i686
# rpm -i --force hdf5-devel*.i686.rpm
####
# rpm --import /mdsplus-gpg.key
# cp /mdsplus/docker/roots/fc20/usr/bin/uil /mdsplus/docker/images/fc20/usr/bin/uil32
# cp /etc/resolv.conf /mdsplus/docker/roots/fc20/etc/
# yum --installroot=/mdsplus/docker/roots/fc20 install -y motif.devel.x86_64 \
#     libSM-devel.x86_64 libICE-devel.x86_64 libX11-devel.x86_64
# 
# exit
# On build system:
# cd /mdsplus/docker/roots/fc20
# tar -czf - . | docker import - mdsplus fc20

FROM mdsplus:fc20

# To build docker image:
#
#    docker build -t mdsplus:build_fc20 .
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

ENTRYPOINT export DIST=fc20; \
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
	   mkdir -p /tmp/deploy; \
	   cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy
