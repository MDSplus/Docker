# MDSplus Windows Builder
#
# Build image using:
#
#    docker build -t mdsplus:build_windows .
#
# Run this using docker with the command:
#
#    docker run --rm=true -e BUILD_NUMBER=${BUILD_NUMBER} -e JOB_NAME="${JOB_NAME}" -e BUILD_FLAVOR=${BUILD_FLAVOR} -v /mdsplus:/mdsplus mdsplus:build_windows
#
# Where: /mdsplus on the host is a mount of alchome:/scratch/mdsplus
#        BUILD_NUMBER and JOB_NAME defined by hudson with the job is run. That is used to add a reference to the job alongside the kit
#        on the download page.
#        BUILD_FLAVOR (i.e. alpha | beta | stable | all)
#
#
# Using the fc20-deploy image with the following added to it:
# yum -y install autoconf automake cvs 'mingw*-gcc-*' 'mingw*-readline' 'mingw*-dlfcn*' \
#    	   	   'mingw*-readline*' 'mingw32-nsis*' '*-openjdk-devel*' python-devel wget binutils make \
#		   mono-devel

FROM mdsplus:fc20

MAINTAINER Tom Fredian, version: 0.1

ENTRYPOINT export DIST=windows; \
	   export LABVIEW_DIR=/mdsplus/extras/Labview-x86; \
	   export LABVIEW64_DIR=/mdsplus/extras/Labview-x86_64; \
	   export IDL_DIR=/mdsplus/extras/idl-x86; \
	   export IDL64_DIR=/mdsplus/extras/idl-x86_64; \ 
	   export JDK_DIR=/mdsplus/extras/windows-jdk; \
	   export WORKSPACE=/tmp/deploy; \
	   export MDSPLUS_DIST=/mdsplus/dist; \
           export MDSPLUS_CERTS=/mdsplus/certs; \
	   export CVSROOT=:pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos; \
	   export PYTHON_INCLUDE_DIR=/mdsplus/extras/windows-python27; \
	   mkdir -p /tmp/deploy; \
	   cd /tmp/deploy; \
	   python /mdsplus/deploy/release.py deploy
