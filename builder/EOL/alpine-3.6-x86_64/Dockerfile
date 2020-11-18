FROM multiarch/alpine:x86_64-v3.6
RUN echo "http://dl-3.alpinelinux.org/alpine/v3.6/main"      >> /etc/apk/repositories && \
    echo "http://dl-3.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories && \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing"   >> /etc/apk/repositories && \
    apk upgrade --update-cache --available && \
    apk add --update alpine-keys && \
    apk add --update bash automake make git rsync tar wget python py-setuptools \
	gcc g++ gfortran binutils libgcc libstdc++ libgfortran \
	libdc1394 libdc1394-dev libraw1394 libraw1394-dev \
	readline readline-dev python-dev hdf5 hdf5-dev\
	motif-dev libxml2-dev libxml2 curl-dev curl freetds-dev dev86 \
	alpine-sdk perl-test-harness py-pip py-numpy \
	openjdk8 openjdk8-jre-lib valgrind && \
    pip2 install --upgrade pip && \
    pip2 install nose tap tap.py
# fine tuning
RUN ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys/ && \
    wget -P /etc/apk/keys/ http://www.mdsplus.org/dist/mdsplus@mdsplus.org-589e05b6.rsa.pub
ENV JDK_DIR=/usr/lib/jvm/java-1.8-openjdk
# next is x86* only
RUN apk add --update libquadmath
