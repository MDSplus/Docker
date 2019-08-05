from centos:7

COPY *.repo /etc/yum.repos.d/
COPY yum-conf-softwarecollections-1.0-1.el7.noarch.rpm  /tmp/
COPY rpm-gpg /etc/pki/rpm-gpg

RUN yum install -y wget epel-release; \
    yum install -y /tmp/yum-conf-softwarecollections-1.0-1.el7.noarch.rpm; \
    yum clean all; \
    yum install -y yum-utils \
      rsync \
      automake git \
      which \
      rpm-build \
      tar \
      make \
      python-devel python-setuptools \
      java-devel \
      globus-common-progs \
      devtoolset-3-gcc devtoolset-3-gcc-c++ devtoolset-3-gcc-gfortran \
      devtoolset-3-binutils \
      devtoolset-3-libstdc++-devel \ 
      devtoolset-3-libquadmath-devel \
      glibc-devel \
      libgfortran \
      libraw1394-devel \
      libdc1394-devel \
      hdf5-devel \
      readline-devel \
      python-devel \
      openmotif-devel \ 
      libcurl-devel \
      libxml2-devel \
      globus-callout-devel \
      globus-gridmap-callout-error-devel \
      globus-gsi-credential-devel \
      globus-gsi-proxy-core-devel  \
      globus-gss-assist-devel \
      globus-gssapi-gsi-devel \
      globus-xio-gsi-driver-devel \
      libX11-devel \
      freetds-devel \
### i686 ###
      devtoolset-3-libstdc++-devel.i686 \
      devtoolset-3-libquadmath-devel.i686 \
      glibc-devel.i686 \
      libgfortran.i686 \
      libraw1394-devel.i686 \
#      libdc1394-devel.i686 \
#      hdf5-devel.i686 \
      readline-devel.i686 \
      python-libs.i686 \
#      openmotif-devel.i686 \
      libcurl-devel.i686 \
      libxml2-devel.i686 \
#      globus-callout-devel.i686 \
#      globus-gridmap-callout-error-devel.i686 \
#      globus-gsi-credential-devel.i686 \
#      globus-gsi-proxy-core-devel.i686  \
#      globus-gss-assist-devel.i686 \
#      globus-gssapi-gsi-devel.i686 \
#      globus-xio-gsi-driver-devel.i686 \
      libX11-devel.i686 \
#      freetds-devel.i686 \
      ;


