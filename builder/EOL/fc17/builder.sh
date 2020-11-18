#!/bin/sh
target=17
temp=$(mktemp -d)
docker run --rm -v ${temp}:/target -it --network=host fedora:20 /bin/sh -c "
mkdir /tmp/root
yum --installroot=/tmp/root --releasever=$target install -y --nogpgcheck fedora-release \
     coreutils \
     wget yum-utils python-setuptools python-pexpect numpy valgrind \
     yum-utils which automake make git rpm-build rpm-sign createrepo \
     gcc gcc-c++ gcc-gfortran binutils libstdc++-devel libstdc++-devel.i686 \
     libquadmath-devel libquadmath-devel.i686 glibc-devel glibc-devel.i686 \
     libgfortran.i686 libraw1394-devel libraw1394-devel.i686 \
     libdc1394-devel libdc1394-devel.i686 blas-devel\
     globus-common-progs globus-callout-devel globus-callout-devel.i686 \
     globus-gridmap-callout-error-devel globus-gridmap-callout-error-devel.i686 \
     globus-gsi-credential-devel globus-gsi-credential-devel.i686 \
     globus-gsi-proxy-core-devel  globus-gsi-proxy-core-devel.i686 \
     globus-gss-assist-devel globus-gss-assist-devel.i686 \
     globus-gssapi-gsi-devel globus-gssapi-gsi-devel.i686 \
     globus-xio-gsi-driver-devel globus-xio-gsi-driver-devel.i686  \
     hdf5-devel hdf5.i686 readline-devel readline-devel.i686  \
     python-devel python-libs.i686 motif-devel.i686 \
     libcurl.i686 libcurl-devel libcurl-devel.i686 libxml2-devel libxml2-devel.i686 \
     libxml2.i686 libX11-devel libX11-devel.i686 freetds-devel \
     perl-Test-Harness.noarch valgrind valgrind.i686 \
     python-pip \
     gdb gdb-gdbserver openssh openssh-ser/ver \
     motif-devel.x86_64 libXt-devel.x86_64
pip install nose tap tap.py
mv /tmp/root/usr/bin/uil /tmp/root/usr/bin/uil32
rm -rf /tmp/root/var/cache/yum
rm /tmp/root/etc/yum.repos.d/*
cat > /tmp/root/etc/yum.repos.d/fedora.repo << EOF
[fedora]
name=Fedora \\\$releasever - \\\$basearch
failovermethod=priority
baseurl=http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/\\\$releasever/Everything/\\\$basearch/os/
enabled=1
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\\\$basearch
EOF
cat > /tmp/root/etc/yum.repos.d/fedora.repo << EOF
[fedora]
name=Fedora \\\$releasever - \\\$basearch
failovermethod=priority
baseurl=http://archives.fedoraproject.org/pub/archive/fedora/linux/updates/\\\$releasever/\\\$basearch/
enabled=1
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\\\$basearch
EOF
tar -czf /target/image -C /tmp/root .
chmod +w /target/image
" && docker import $temp/image mdsplus/fedora:$target && \
test  "$1" = "push" && docker push mdsplus/fedora:$target
