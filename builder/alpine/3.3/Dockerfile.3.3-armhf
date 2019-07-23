#
# IMPORTANT:
#
# The following docker command is required to be run to enable the arm emulation in the host
# kernel. This must be run once after a reboot to enable docker to use the armhf images.
#
# docker run --rm --privileged multiarch/qemu-user-static:register --reset
#
FROM multiarch/alpine:armhf-v3.3
RUN echo "http://dl-3.alpinelinux.org/alpine/v3.3/main"      >> /etc/apk/repositories && \
    echo "http://dl-3.alpinelinux.org/alpine/v3.3/community" >> /etc/apk/repositories && \
    apk upgrade --update-cache --available && \
    apk add --update alpine-keys && \
    apk add --update bash automake make git rsync tar wget python py-setuptools \
	gcc g++ gfortran binutils libgcc libstdc++ libgfortran \
	libdc1394 libdc1394-dev libraw1394 libraw1394-dev \
	readline readline-dev python-dev \
	motif-dev libxml2-dev libxml2 curl-dev curl freetds-dev dev86 \
	alpine-sdk perl-test-harness py-pip && \
    pip2 install --upgrade pip && \
    pip2 install nose numpy tap tap.py
# fine tuning
RUN ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys/ && \
    wget -P /etc/apk/keys/ http://www.mdsplus.org/dist/mdsplus@mdsplus.org-589e05b6.rsa.pub
# arm only
RUN apk add --update openjdk7 openjdk7-jre-lib
ENV JDK_DIR=/usr/lib/jvm/java-1.7-openjdk
