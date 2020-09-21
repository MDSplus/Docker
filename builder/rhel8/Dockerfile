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
      libstdc++-devel libstdc++-devel.i686 \ 
      libquadmath-devel libquadmath-devel.i686 \
      glibc-devel glibc-devel.i686 \
      libgfortran.i686 \
      libusb.i686 \
      libdc1394.i686 \
      libdc1394.x86_64 \
      libraw1394.i686 \
      libraw1394.x86_64 \
      hdf5 \
      readline-devel readline-devel.i686 \
      platform-python-devel.i686 \
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
      freetds-devel
RUN /bin/mv /usr/bin/uil /usr/bin/uil32

# Packages required for testing
RUN yum install -y \
                   perl-Test-Harness.noarch \
                   valgrind valgrind.i686

RUN pip2 install tap tap.py

# to run debugger in container
RUN yum install -y \
                   gdb gdb-gdbserver \
                   openssh openssh-server

RUN yum install -y libasan.x86_64 libasan.i686 libtsan.x86_64
