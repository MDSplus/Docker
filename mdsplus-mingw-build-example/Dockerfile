# Sample dockerfile to build MDSplus for Windows from scratch
FROM fedora

MAINTAINER Tom Fredian, version: 0.1

RUN yum -y install autoconf automake cvs 'mingw*-gcc-*' 'mingw*-readline' 'mingw*-dlfcn*' \
    	   	   'mingw*-readline*' 'mingw32-nsis*' '*-openjdk-devel*' wget binutils make
RUN yum -y update
ADD http://www.mdsplus.org/dist/SOURCES/mingw-extras.tgz /tmp/
WORKDIR /tmp
RUN tar zxf mingw-extras.tgz
RUN cvs -d :pserver:MDSguest:MDSguest@www.mdsplus.org:/mdsplus/repos co mdsplus
WORKDIR mdsplus
RUN ./configure --host=i686-w64-mingw32 --build=i686-redhat-linux-gnu --target=i686-w64-mingw32 \
    		--prefix=/tmp/mingw-build --exec-prefix=/tmp/mingw-build --libdir=/tmp/mingw-build/bin_x86 \
		--bindir=/tmp/mingw-build/bin_x86 --with-labview=/tmp/mingw-extras/Labview-x86 \
		--with-jdk=/etc/alternatives/java_sdk --with-idl=/tmp/mingw-extras/idl-x86 \
		--with-java_target=6 --with-java_bootclasspath=$(pwd)/rt.jar; make; \
    make install; \
    make clean; \
    ./configure --host=x86_64-w64-mingw32 --build=x86_64-redhat-linux-gnu --target=x86_64-w64-mingw32 \
    		--prefix=/tmp/mingw-build --exec-prefix=/tmp/mingw-build --libdir=/tmp/mingw-build/bin_x86_64 \
		--bindir=/root/mingw-build/bin_x86_64 --with-labview=$(HOME)/mingw-extras/Labview-x86_64 \
		--with-jdk=/etc/alternatives/java_sdk --with-idl=/tmp/mingw-extras/idl-x86_64 \
		--with-java_target=6 --with-java_bootclasspath=$(pwd)/rt.jar; \
    make; \
    make install; \
    make clean
WORKDIR /tmp/mingw-build
RUN makensis -DMAJOR=0 -DMINOR=0 -DRELEASE=1 -DFLAVOR=-docker -NOCD \
             -DOUTDIR=/tmp /tmp/mdsplus/deploy/mdsplus.nsi; ls /tmp

RUN find /tmp/mingw-build
