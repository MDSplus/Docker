# This dockerfile no longer works. centos:7 does not support 32-bit packages and
# the trick to get them from a fedora 22 repo nolonger works.
#
# We should look into deprecating 32-bit support for el7 which will require
# a special option for redhat platforms to not attempt the 32-bit builds and rpm
# creatiions.

from centos:7

COPY fedora.repo /

RUN yum update -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y wget yum-utils python-setuptools pexpect numpy \
      rsync valgrind which\
      automake make git \
      rpm-build rpm-sign createrepo \
      tar \
      gcc gcc-c++ gcc-gfortran \
      binutils \
      libstdc++-devel libstdc++-devel.i686 \ 
      libquadmath-devel libquadmath-devel.i686 \
      glibc-devel glibc-devel.i686 \
      libgfortran.i686 \
      libusb.i686 \
      libraw1394-devel libraw1394-devel.i686 libdc1394-devel libdc1394-devel.i686 \
      hdf5-devel hdf5.i686 \
      readline-devel readline-devel.i686 \
      python-devel python-libs.i686 \
      java-1.8.0-openjdk-devel \
      motif-devel.i686 \ 
      libcurl libcurl.i686 libcurl-devel libcurl-devel.i686 \
      libxml2-devel libxml2-devel.i686 libxml2.i686 \
      globus-common-progs \
      globus-callout-devel globus-callout-devel.i686 \
      globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
      globus-gsi-credential-devel globus-gsi-credential-devel.i686 \
      globus-gsi-proxy-core-devel  globus-gsi-proxy-core-devel.i686 \
      globus-gss-assist-devel globus-gss-assist-devel.i686 \
      globus-gssapi-gsi-devel globus-gssapi-gsi-devel.i686 \
      globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686 \
      libX11-devel libX11-devel.i686 \
      freetds-devel freetds-devel.i686
RUN /bin/mv /usr/bin/uil /usr/bin/uil32
RUN yum install -y motif-devel.x86_64 libXt-devel.x86_64
RUN cp fedora.repo /etc/yum.repos.d/
RUN yum list hdf5-devel.i686
RUN yumdownloader hdf5.i686 hdf5-devel.i686
RUN yumdownloader globus-*.i686
RUN yumdownloader freetds.i686
RUN yumdownloader freetds-devel.i686
RUN yumdownloader libraw1394.i686 libraw1394-devel.i686 libdc1394.i686 libdc1394-devel.i686
RUN rpm -i --nodeps --force *.rpm
RUN rm -f /etc/yum.repos.d/fedora.repo ./*.rpm





# Packages required for testing
RUN yum install -y \
                   perl-Test-Harness.noarch \
                   valgrind valgrind.i686

RUN yum install -y python-setuptools; \
    easy_install-2.7 pip; \
    pip2 install nose tap tap.py

# to run debugger in container
RUN yum install -y \
                   gdb gdb-gdbserver \
                   openssh openssh-server

RUN yum install -y libasan.x86_64 libasan.i686 libtsan.x86_64
