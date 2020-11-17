#
# IMPORTANT:
#
# The following docker command is required to be run to enable the arm emulation in the host
# kernel. This must be run once after a reboot to enable docker to use the armhf images.
#
# docker run --rm --privileged multiarch/qemu-user-static:register --reset
#
FROM multiarch/alpine:armhf-v3.9

ENV JDK_DIR=/usr/lib/jvm/java-1.8-openjdk
RUN apk upgrade --update-cache --available && \
    apk add bash automake make git rsync tar python py-setuptools \
        gcc g++ gfortran binutils libgcc libstdc++ libgfortran \
        blas blas-dev \
        libdc1394 libdc1394-dev \
        libraw1394 libraw1394-dev \
        readline readline-dev \
        python-dev py2-pip py-numpy \
        motif-dev libxml2-dev libxml2 \
        curl curl-dev \
        freetds-dev dev86 \
        alpine-sdk \
        perl-test-harness \
        openjdk8 openjdk8-jre-lib \
        valgrind && \
    pip2 install --upgrade pip && \
    pip2 install nose tap tap.py && \
#    apk add libquadmath && \ # not available for armhf
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update alpine-keys && \
    apk add --update hdf5 hdf5-dev && \
    ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys/ && \
    curl -s http://www.mdsplus.org/dist/mdsplus@mdsplus.org-589e05b6.rsa.pub \
                     > /etc/apk/keys/mdsplus@mdsplus.org-589e05b6.rsa.pub && \
    rm /var/cache/apk/*
CMD /bin/bash
