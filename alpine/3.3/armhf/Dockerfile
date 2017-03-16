#
# IMPORTANT:
#
# The following docker command is required to be run to enable the arm emulation in the host
# kernel. This must be run once after a reboot to enable docker to use the armhf images.
#
# docker run --rm --privileged multiarch/qemu-user-static:register --reset
#
from multiarch/alpine:armhf-edge
RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    apk update; \
    apk add alpine-keys; \
    apk add bash automake make git rsync tar python py-setuptools \
       gcc g++ gfortran binutils libgcc libstdc++ libgfortran \
       libdc1394 libdc1394-dev libraw1394 libraw1394-dev  \
       readline readline-dev python-dev \
       motif-dev libxml2-dev libxml2 curl-dev curl freetds-dev dev86 \
       hdf5 hdf5-dev alpine-sdk perl-test-harness valgrind py2-pip; \
    ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys; \
    ln -sf /usr/include/locale.h /usr/include/xlocale.h; \
    pip install --upgrade pip; \
    pip install numpy nose tap tap.py

ADD mdsplus@mdsplus.org-589e05b6.rsa.pub /etc/apk/keys/
ADD abuild.conf /.abuild/

