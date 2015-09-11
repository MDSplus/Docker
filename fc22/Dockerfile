from fedora:22

RUN dnf update -y; \ 
    dnf install -y wget python-setuptools pexpect numpy \
      which rsync dnf-plugins-core valgrind \
      automake make git \
      rpm-build rpm-sign createrepo \
      tar \
      gcc gcc-c++.x86_64 gcc-gfortran.x86_64 \
      binutils.x86_64 \
      libstdc++-devel.x86_64 libstdc++-devel.i686 \ 
      libquadmath-devel.x86_64 libquadmath-devel.i686 \
      glibc-devel.x86_64 glibc-devel.i686 \
      libgfortran.x86_64 libgfortran.i686 \
      libraw1394-devel.x86_64 libraw1394-devel.i686 libdc1394-devel.x86_64 libdc1394-devel.i686 \
      hdf5-devel.x86_64 hdf5.x86_64 hdf5.i686 \
      readline-devel.x86_64 readline-devel.i686 \
      python-devel.x86_64 python-libs.i686 \
      java-1.8.0-openjdk-devel.x86_64 \
      motif-devel.i686 libSM-devel.i686 libICE-devel.i686 \ 
      libcurl.x86_64 libcurl.i686 libcurl-devel.x86_64 libcurl-devel.i686 \
      libxml2-devel.x86_64 libxml2-devel.i686 libxml2.x86_64 libxml2.i686 \
      globus-common-progs \
      globus-callout-devel.x86_64 globus-callout-devel.i686 \
      globus-gridmap-callout-error-devel.x86_64 globus-gridmap-callout-error-devel.i686 \
      globus-gsi-credential-devel.x86_64 globus-gsi-credential-devel.i686 \
      globus-gsi-proxy-core-devel.x86_64  globus-gsi-proxy-core-devel.i686 \
      globus-gss-assist-devel.x86_64 globus-gss-assist-devel.i686 \
      globus-gssapi-gsi-devel.x86_64 globus-gssapi-gsi-devel.i686 \
      globus-xio-gsi-driver-devel.x86_64 globus-xio-gsi-driver-devel.i686 \
      libX11-devel.x86_64 libX11-devel.i686 \
      freetds-devel.x86_64 freetds-devel.i686; \
    /bin/mv /usr/bin/uil /usr/bin/uil32; \
    dnf install -y motif-devel.x86_64 libXt-devel.x86_64

RUN dnf download hdf5-devel.i686; \
    rpm -i --force /*.rpm

