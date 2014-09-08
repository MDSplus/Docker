# Sample dockerfile to build MDSplus for Windows from scratch
FROM ubuntu:12.04

MAINTAINER Tom Fredian, version: 0.1

RUN apt-get update; \
    apt-get install -y autoconf automake cvs gcc gfortran g++ libreadline-dev \
    	  openjdk-7-jdk wget make; \
    apt-get -y upgrade
ADD http://www.mdsplus.org/dist/SOURCES/mingw-extras.tgz /tmp/
WORKDIR /tmp
RUN tar zxf mingw-extras.tgz; \
    cvs -d :pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos co mdsplus
WORKDIR mdsplus
RUN ./configure --prefix=/tmp/build --exec-prefix=/tmp/build \
		--with-labview=/tmp/mingw-extras/Labview-x86_64 \
		--with-jdk=/usr/lib/jvm/java-7-openjdk-amd64 \
                --with-idl=/tmp/mingw-extras/idl-x86_64 \
		--with-java_target=6 --with-java_bootclasspath=$(pwd)/rt.jar; make; \
    make install; \
    make clean
