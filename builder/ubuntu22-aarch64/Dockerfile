#
# IMPORTANT:
# For simplicity, the MDSplus build system does not use multi-architecture 
# images.  So although this is almost identical to the ubuntu22-64/Dockerfile, 
# it must be built with either of these two methods:
#    1) build the Docker image on an ARM 64-bit CPU, or
#    2) use an x86_64 CPU with the QEMU emulator (see notes below).
# 
# And the resulting Docker image should be tagged for aarch64 (aka arm64).
#    docker build -t mdsplus/builder:ubuntu22-aarch64 .   
#
# ARM NOTES:
# If building on a 64-bit ARM CPU, only need the second FROM statement.  It 
# specifies the platform so that if the Docker build is inadvertantly done 
# on x86_64 without QEMU, it will fail.
#
# QEMU NOTES:
# The following docker command is required to enable the ARM emulation in the
# x86_64 host kernel. This must be run once after a reboot to enable Docker to
# use the ARM images.
#    docker run --rm --privileged multiarch/qemu-user-static:register --reset
# 
# The emulator also has to be copied into the Docker image.  So if creating
# the image on x86_64, uncomment two lines below.
#

# For QEMU, uncomment next line
# FROM multiarch/qemu-user-static:x86_64-aarch64 as qemu
FROM --platform=arm64 ubuntu:jammy
# For QEMU, uncomment next line
# COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin

RUN apt-get update\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && DEBIAN_FRONTEND=noninteractive apt-get -qq -y install\
	automake\
	freetds-dev\
	g++\
	gdb\
	gfortran\
	git\
	libasan?\
	libblas-dev\
	libcurl4-gnutls-dev\
	libdc1394-dev\
	libglobus-callout-dev\
	libglobus-gridmap-callout-error-dev\
	libglobus-gsi-credential-dev\
	libglobus-gsi-proxy-core-dev\
	libglobus-gssapi-gsi-dev\
	libglobus-gss-assist-dev\
	libglobus-xio-gsi-driver-dev\
	libmotif-dev\
	libraw1394-dev\
	libreadline-dev\
	libtest-harness-perl\
	libtsan?\
	libubsan?\
	libxml2-dev\
	libxt-dev\
	nano\
	make\
	openjdk-8-jdk\
	pkg-config\
	python3-numpy\
	python3-pip\
	reprepro\
	rsync\
	tar\
	valgrind\
 && ln -sf python3 /usr/bin/python\
 && python -m pip -q install nose tap tap.py\
# cleanup
 && rm -rf /tmp/*\
 && apt-get clean
CMD /bin/bash
