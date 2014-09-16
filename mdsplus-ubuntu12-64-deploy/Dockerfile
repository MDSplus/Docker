# Sample dockerfile to build MDSplus for Ubuntu12-64 from scratch
FROM ubuntu:12.04
# To build docker image:
#
#    docker build -t mdsplus:buildUbuntu12-64 .
# 
# To run MDSplus build in hudson:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} -v /mdsplus:/mdsplus mdsplus:buildWindowsUbuntu12-64
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#

MAINTAINER Tom Fredian, version: 0.1

RUN apt-get update; \
    apt-get install -y autoconf automake cvs gcc gfortran g++ libreadline-dev \
    	  openjdk-7-jdk wget make python-pexpect; \
    apt-get -y upgrade; \
    mkdir /mdsplus
WORKDIR /tmp
RUN cvs -d :pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos co deploy;
WORKDIR /tmp/deploy
ENTRYPOINT cvs -q update -d; \
	   export DIST=Ubuntu12; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
	   export IDL64_DIR=/mdsplus/extras/idl=x86_64; \
	   export JDK_DIR=/usr/lib/jvm/java-7-openjdk-amd64; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
	   export MDSPLUS_CERTS=/mdsplus/certs; \
	   python release.py deploy
