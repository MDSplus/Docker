# Sample dockerfile to build MDSplus for fc17 from scratch
#
#
# To build fc17 image:
#
# yum --installroot=/mdsplus/docker/roots/fc17 --releasever=18 install -y --nogpgcheck fedora-release coreutils yum\
#     tcsh which wget bind-utils vim-minimal openssl python-setuptools pexpect numpy rsync make automake cvs git \
#     sudo rpm-sign rpm-build createrepo yum-utils tar \ 
#     readline-devel readline-devel.i686 gcc glibc-devel glibc-devel.i686 gcc-gfortran gcc-gfortran.i686 \
#     gcc-c++ java-1.7.0-openjdk-devel libcurl-devel libcurl-devel.i686 \
#     globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686 \
#     globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
#     freetds-devel hdf5-devel python-devel python-devel.i686 \
#     motif-devel.i686 libSM-devel.i686 libICE-devel.i686 libX11-devel.i686
# mknod /mdsplus/docker/roots/fc17/dev/random c 1 9
# mknod /mdsplus/docker/roots/fc17/dev/urandom c 1 9
# cp /etc/resolv.conf /mdsplus/docker/roots/fc17/etc/
# tar -zxf -C /mdsplus/certs/rpm-signing-keys.tgz /mdsplus/docker/roots/fc17/root/
# chown -R root:root /mdsplus/docker/roots/fc17/root/.gnupg
# cp /mdsplus/dist/mdsplus.gpg.key /mdsplus/docker/roots/fc17/
# cp /etc/resolv.conf /mdsplus/docker/roots/fc17/etc/
# chroot /mdsplus/docker/roots/fc17
#### hdf5 and freetds-devel have a problem installing both the 32-bit and 64-bit rpms so this is the workaround
# yum install hdf5.i686 libgcrypt.i686
# yumdownloader hdf5-devel.i686
# rpm -i --force hdf5-devel*.i686.rpm
####
# rpm --import /mdsplus-gpg.key
# cp /bin/uil /bin/uil32
# yum install -y motif-devel.x86_64 \
#     libSM-devel.x86_64 libICE-devel.x86_64 libX11-devel.x86_64
# chmod u+w /etc/sudoers
##### vi /etc/sudoers and comment out the requiretty line
# chmod u-w /etc/sudoers
# exit
# On build system:
# cd /mdsplus/docker/roots/fc17
# tar -czf - . | docker import - mdsplus fc17

FROM mdsplus:fc17
# To build docker image:
#
#    docker build -t mdsplus:build_fc17 .
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

ENTRYPOINT export DIST=fc17; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
           export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \
           export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export JDK_DIR=/etc/alternatives/java_sdk_openjdk; \
           export PYTHON_INCLUDE_DIR=/usr/include/python2.7; \
	   mkdir -p /tmp/deploy; \
           cd /mdsplus/git/mdsplus; \
           git checkout alpha; \
           git pull; \
	   cd /tmp/deploy; \
	   python /mdsplus/git/mdsplus/deploy/release.py deploy
