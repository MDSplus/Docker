from centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*\
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*\
 && yum -q -y install epel-release dnf-plugins-core\
 && yum -q -y config-manager --set-enabled powertools\
 && yum -q -y update\
 && yum -q -y install\
	automake\
	binutils\
	bison\
	blas-devel\
	blas-devel.i686\
	createrepo\
	flex\
	freetds-devel\
	gcc\
	gcc-c++\
	gcc-gfortran\
	gdb\
	gdb-gdbserver\
	git\
	globus-callout-devel\
	globus-common-progs\
	globus-gridmap-callout-error-devel\
	globus-gsi-credential-devel\
	globus-gsi-proxy-core-devel\
	globus-gssapi-gsi-devel\
	globus-gss-assist-devel\
	globus-xio-gsi-driver-devel\
	gperf\
	hdf5\
	hdf5-devel.x86_64\
	java-1.8.0-openjdk-devel\
	libasan.x86_64\
	libcurl-devel\
	libdc1394.x86_64\
	libraw1394-devel\
	libraw1394.x86_64\
	libtsan.x86_64\
	libX11-devel\
	libxml2\
	libxml2-devel\
	make\
	maven\
	motif-devel\
	openssh\
	openssh-server\
	perl-Test-Harness.noarch\
	platform-python-devel.x86_64\
	platform-python-setuptools\
	python2-libs\
	python2-numpy\
	python3-libs\
	python3-numpy\
	python3-pexpect\
	readline-devel\
	rpm-build\
	rpm-sign\
	rsync\
	tar\
	valgrind\
	wget\
	which\
	yum-utils\
 && pip2 install tap tap.py pexpect\
# to run debugger in container
 && yum -q -y install\
	ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/28/Everything/x86_64/os/Packages/l/libdc1394-devel-2.2.2-10.fc28.x86_64.rpm\ 
	ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/28/Everything/x86_64/os/Packages/l/libdc1394-2.2.2-10.fc28.x86_64.rpm\
 && alternatives --set python /usr/bin/python2\
# cleanup
 && rm -rf ~\
 && rm -rf /tmp/*\
 && yum clean all
CMD /bin/bash
