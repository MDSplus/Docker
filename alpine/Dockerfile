from alpine:3.3
# ADD repositories /etc/apk/repositories
# /src/configure --host x86_64-linux --with-jdk=/usr/lib/jvm/java-1.8-openjdk
RUN apk -U add bash automake make git tar python py-setuptools \
    gcc g++ gfortran binutils libgcc libstdc++ libquadmath libgfortran \
    libdc1394 libdc1394-dev libraw1394 libraw1394-dev  \
    readline readline-dev python-dev \
    motif-dev libxml2-dev libxml2 curl-dev curl freetds-dev

RUN apk -U add py-numpy openjdk8 openjdk8-jre-lib \
   --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted
RUN apk -U add hdf5 hdf5-dev --repository http://dl-3.alpinelinux.org/alpine/edge/testing --allow-untrusted
