# This dockerfile no longer works. centos:7 does not support 32-bit packages and
# the trick to get them from a fedora 22 repo nolonger works.
#
# We should look into deprecating 32-bit support for el7 which will require
# a special option for redhat platforms to not attempt the 32-bit builds and rpm
# creatiions.

from centos:8

#COPY fedora.repo /
RUN yum -y install dnf-plugins-core 
RUN yum -y config-manager --set-enabled PowerTools
RUN yum update -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum install -y wget yum-utils platform-python-setuptools python3-pexpect python2-numpy python3-numpy \
      rsync valgrind which\
      automake make git \
      rpm-build rpm-sign createrepo \
      tar \
      gcc gcc-c++ gcc-gfortran \
      binutils \
      libdc1394.x86_64 \
      libraw1394.x86_64 \
      hdf5 \
      readline-devel \ 
      platform-python-devel.x86_64 \
      python2-libs \
      python3-libs \
      java-1.8.0-openjdk-devel motif-devel libcurl-devel libxml2-devel libxml2-devel libxml2 \
      globus-common-progs \
      globus-callout-devel \
      globus-gridmap-callout-error-devel \
      globus-gsi-credential-devel \
      globus-gsi-proxy-core-devel \
      globus-gss-assist-devel \
      globus-gssapi-gsi-devel \
      globus-xio-gsi-driver-devel \
      libX11-devel \
      freetds-devel \
      flex \
      bison \
      gperf \
      hdf5-devel.x86_64\
      maven

#RUN ln -s /usr/bin/python2 /usr/lib/python; 


# Packages required for testing
RUN yum install -y \
                   perl-Test-Harness.noarch \
                   valgrind 

RUN pip2 install tap tap.py pexpect

# to run debugger in container
RUN yum install -y \
	gdb gdb-gdbserver \
	openssh openssh-server

RUN yum install -y libasan.x86_64 \
                   libtsan.x86_64

#RUN ln -s /usr/bin/python2 /usr/bin/python
RUN  dnf -y install \
     ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/28/Everything/x86_64/os/Packages/l/libdc1394-devel-2.2.2-10.fc28.x86_64.rpm \ 
     ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/28/Everything/x86_64/os/Packages/l/libdc1394-2.2.2-10.fc28.x86_64.rpm \
     libraw1394-devel
#RUN ln -s /usr/lib64/libdc1394.so.22 /usr/lib64/libdc1394.so
#RUN ln -s /usr/lib64/libraw1394.so.11 /usr/lib64/libraw1394.so
#RUN dnf install http://repo.okay.com.mx/centos/8/x86_64/release/okay-release-1-1.noarch.rpm
#RUN dnf install libdc1394-devel
#RUN dnf install https://pkgs.dyn.su/el8/base/x86_64/raven-release-1.0-1.el8.noarch.rpm
#RUN dnf install raven-release
#RUN dnf -y install  --enablerepo=raven-multimedia --allowerasing libdc1394-devel
#RUN rpm -i --nodeps --force http://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/x86_64/libdc1394-devel-2.2.6-3.6.x86_64.rpm 
RUN alternatives --set python /usr/bin/python2
