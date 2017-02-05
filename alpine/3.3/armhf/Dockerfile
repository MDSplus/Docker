from multiarch/alpine:armhf-edge
RUN apk update; \
    apk add bash automake make git rsync tar python py-setuptools \
       gcc g++ gfortran binutils libgcc libstdc++ libgfortran \
       libdc1394 libdc1394-dev libraw1394 libraw1394-dev  \
       readline readline-dev python-dev \
       motif-dev libxml2-dev libxml2 curl-dev curl freetds-dev dev86; \
       ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted \ 
       add py-numpy openjdk8 openjdk8-jre-lib; \
    apk --no-cache --repository=http://dl-3.alpinelinux.org/alpine/edge/testing --allow-untrusted \
       add hdf5 hdf5-dev

ENV JDK_DIR=/usr/lib/jvm/java-1.8-openjdk

