from fedora:28

RUN dnf update -y;

RUN dnf install -y \
    wget pexpect which nano rsync dnf-plugins-core \
    automake make git rpm-build rpm-sign createrepo tar \
    gcc gcc-c++ gcc-gfortran gcc-gfortran.i686 binutils.x86_64 \
    libSM-devel.i686 libICE-devel.i686

RUN dnf install -y \
    libgfortran.x86_64        libgfortran.i686 \
    readline-devel.x86_64     readline-devel.i686 \
    libxml2-devel.x86_64      libxml2-devel.i686 \
    libstdc++-devel.x86_64    libstdc++-devel.i686 \
    libquadmath-devel.x86_64  libquadmath-devel.i686 \
    glibc-devel.x86_64        glibc-devel.i686 \
    libraw1394-devel.x86_64   libraw1394-devel.i686 \
    libdc1394-devel.x86_64    libdc1394-devel.i686 \
    libX11-devel.x86_64       libX11-devel.i686 \
    freetds-devel.x86_64      freetds-devel.i686 \
    hdf5.x86_64               hdf5.i686 \
    libcurl-devel.x86_64      libcurl-devel.i686

# force install hdf5-devel.i686
RUN dnf install -y 'dnf-command(download)' zlib-devel.i686 libaec-devel.i686 hdf5-devel.x86_64;\
    dnf download hdf5-devel.i686; \
    rpm -i --force hdf5-devel*.rpm; \
    rm -f hdf5-devel*.rpm;

RUN dnf install -y motif-devel.i686   libXt-devel.i686; \
    /bin/mv /usr/bin/uil /usr/bin/uil32; \
    dnf install -y motif-devel.x86_64 libXt-devel.x86_64;

# java
RUN dnf install -y java-1.8.0-openjdk-devel

# globus
RUN dnf install -y \
    globus-xio-devel.x86_64                   globus-xio-devel.i686 \
    globus-callout-devel.x86_64               globus-callout-devel.i686 \
    globus-gridmap-callout-error-devel.x86_64 globus-gridmap-callout-error-devel.i686 \
    globus-gsi-credential-devel.x86_64        globus-gsi-credential-devel.i686 \
    globus-gsi-proxy-core-devel.x86_64        globus-gsi-proxy-core-devel.i686 \
    globus-gss-assist-devel.x86_64            globus-gss-assist-devel.i686 \
    globus-gssapi-gsi-devel.x86_64            globus-gssapi-gsi-devel.i686 \
    globus-xio-gsi-driver-devel.x86_64        globus-xio-gsi-driver-devel.i686 \
    globus-gssapi-error-devel.x86_64         globus-gssapi-error-devel.i686 \
    globus-common-devel.x86_64                globus-common-devel.i686; \
    /bin/ln -sf /usr/include/globus/* /usr/include/

# Testing:
RUN dnf install -y \
    perl-Test-Harness.noarch \
    valgrind valgrind.i686 \
    libasan.x86_64 libasan.i686 \
    libubsan.x86_64 libubsan.i686 \
    libtsan.x86_64;
# libtsan.i686;

# to run debugger in container
RUN dnf install -y \
   gdb gdb-gdbserver \
   openssh-server \
   strace procps-ng

# testing python
# python3.6 64bit
RUN pip3 install --upgrade pip; \
    pip3 install numpy nose tap tap.py; \
    mv /usr/bin/python3.6m /usr/bin/python3.6-x86_64;

# python2.7 32bit
RUN pip2 install numpy tap tap.py; \
    mv /usr/bin/python2.7 /usr/bin/python2.7-x86_64; \
    ln -sf python2.7-x86_64 /usr/bin/python2.7;

# python2.7 32bit
RUN dnf remove -y python2; \
    dnf install -y python2.i686; \
    pip2 install numpy nose tap tap.py; \
    mv /usr/bin/python2.7 /usr/bin/python2.7-i686; \
    dnf install -y python2.x86_64

# set default
RUN ln -sf python3        /usr/bin/python; \
    ln -sf python3.6-x86_64 /usr/bin/python3; \
    ln -sf python2.7-i686   /usr/bin/python2.7; \
    ln -sf libpython3.6m.so.1.0 /lib64/libpython3.6.so; \
    ln -sf libpython2.7.so.1.0  /lib/libpython2.7.so
