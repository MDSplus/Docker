from centos:6

RUN yum install -y wget epel-release; \
    rpm --import https://github.com/cms-sw/cms-docker/raw/master/slc6-vanilla/RPM-GPG-KEY-cern; \
    wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo; \
    yum clean all; \
    yum install -y yum-utils python-setuptools pexpect numpy createrepo \
      rsync valgrind \
      automake git \
      which \
      rpm-build \
      tar \
      devtoolset-2-gcc devtoolset-2-gcc-c++ devtoolset-2-gcc-gfortran \
      devtoolset-2-binutils \
      devtoolset-2-libstdc++-devel devtoolset-2-libstdc++-devel.i686 \ 
      devtoolset-2-libquadmath-devel devtoolset-2-libquadmath-devel.i686 \
      glibc-devel glibc-devel.i686 \
      glibc-devel.i686 \
      libgfortran.i686 \
      libraw1394-devel libraw1394-devel.i686 libdc1394-devel libdc1394-devel.i686 \
      hdf5-devel hdf5.i686 \
      readline-devel readline-devel.i686 \
      python-devel python-libs.i686 \
      java7-devel \
      openmotif-devel.i686 \ 
      libcurl-devel libcurl-devel.i686 \
      libxml2-devel libxml2-devel.i686 \
      zlib-devel zlib-devel.i686 \
      globus-common-progs \
      globus-callout-devel globus-callout-devel.i686 \
      globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
      globus-gsi-credential-devel globus-gsi-credential-devel.i686 \
      globus-gsi-proxy-core-devel  globus-gsi-proxy-core-devel.i686 \
      globus-gss-assist-devel globus-gss-assist-devel.i686 \
      globus-gssapi-gsi-devel globus-gssapi-gsi-devel.i686 \
      globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686 \
      libX11-devel libX11-devel.i686 \
      freetds-devel freetds-devel.i686; \
    /bin/mv /usr/bin/uil /usr/bin/uil32; \
    yum install -y openmotif-devel.x86_64 libXt-devel.x86_64; \
    yumdownloader hdf5-devel.i686; \
    rpm -i --force hdf5-devel*.rpm



# //////////////////////////////////////////////////////////////////////////// #
# /// TESTS ////////////////////////////////////////////////////////////////// #
# //////////////////////////////////////////////////////////////////////////// #

# Packages required for testing
RUN yum install -y \
                   perl-Test-Harness \
                   valgrind valgrind.i686

# Install cpanminus installer for perl and upgrade TAP::Parser at latest
# version.
RUN curl -L http://cpanmin.us | perl - --self-upgrade; \
    cpanm TAP::Parser

RUN yum install -y python-pip; \
    pip2 install --upgrade setuptools nose tap tap.py

# to run debugger in container
RUN yum install -y \
                   gdb gdb-gdbserver \
                   openssh openssh-server

# enable devtoolset for each session
RUN echo . /opt/rh/devtoolset-2/enable >> /etc/profile

Run yum install -y libasan.x86_64 libasan.i686 libtsan.x86_64
