# Sample dockerfile to build MDSplus for raspberrypi from scratch
#
#

FROM mdsplus:raspberrypi


# To build docker image:
#
#    docker build -t mdsplus:build_raspberrypi .
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

ENTRYPOINT export DIST=raspberrypi; \
	   export JDK_DIR=/usr/lib/jvm/java-7-openjdk-i386; \
           export PYTHON_INCLUDE_DIR=/mdsplus/extras/raspberrypi/rootfs/usr/include/python2.7; \
	   mkdir -p /tmp/deploy; \
           cd /mdsplus/git/mdsplus; \
           git checkout alpha; \
           git pull; \
	   cd /tmp/deploy; \
	   python /mdsplus/git/mdsplus/deploy/release.py deploy
