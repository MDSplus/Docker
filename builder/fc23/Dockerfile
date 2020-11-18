from fedora:23

RUN dnf -y update\
# ensure download
 && dnf -y install 'dnf-command(download)'\
# preserve python32
 && dnf download python.x86_64 python.i686\
 && rpm -e --nodeps python.x86_64\
 && rpm -i --force --nodeps python*.i686.rpm\
 && mv /usr/bin/python2.7 /usr/bin/python-i686\
 && rpm -i --force --nodeps python*.x86_64.rpm\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && dnf -y install\
	atlas.i686\
	automake\
	binutils.x86_64\
	blas-devel.i686\
	blas-devel.x86_64\
	createrepo\
	dnf-plugins-core\
	freetds-devel.i686\
	freetds-devel.x86_64\
	gcc\
	gcc-c++.x86_64\
	gcc-gfortran.x86_64\
	gdb\
	gdb-gdbserver\
	git\
	glibc-devel.i686\
	glibc-devel.x86_64\
	globus-callout-devel.i686\
	globus-callout-devel.x86_64\
	globus-common-devel.i686\
	globus-common-devel.x86_64\
	globus-common.i686\
	globus-common.x86_64\
	globus-gridmap-callout-error-devel.i686\
	globus-gridmap-callout-error-devel.x86_64\
	globus-gsi-credential-devel.i686\
	globus-gsi-credential-devel.x86_64\
	globus-gsi-proxy-core-devel.i686\
	globus-gsi-proxy-core-devel.x86_64\
	globus-gssapi-gsi-devel.i686\
	globus-gssapi-gsi-devel.x86_64\
	globus-gss-assist-devel.i686\
	globus-gss-assist-devel.x86_64\
	globus-xio-devel.i686\
	globus-xio-devel.x86_64\
	globus-xio-gsi-driver-devel.i686\
	globus-xio-gsi-driver-devel.x86_64\
	hdf5.i686\
	hdf5.x86_64\
	java-1.8.0-openjdk-devel.x86_64\
	libasan.i686\
	libasan.x86_64\
	libcurl-devel.i686\
	libcurl-devel.x86_64\
	libcurl.i686\
	libcurl.x86_64\
	libdc1394-devel.i686\
	libdc1394-devel.x86_64\
	libgfortran.i686\
	libgfortran.x86_64\
	libICE-devel.i686\
	libICE-devel.x86_64\
	libquadmath-devel.i686\
	libquadmath-devel.x86_64\
	libraw1394-devel.i686\
	libraw1394-devel.x86_64\
	libSM-devel.i686\
	libSM-devel.x86_64\
	libstdc++-devel.i686\
	libstdc++-devel.x86_64\
	libtsan.x86_64\
	libubsan.i686\
	libubsan.x86_64\
	libX11-devel.i686\
	libX11-devel.x86_64\
	libxml2-devel.i686\
	libxml2-devel.x86_64\
	libxml2.i686\
	libxml2.x86_64\
	libXt-devel.i686\
	libXt-devel.x86_64\
	make\
	openssh\
	openssh-server\
	perl-Test-Harness.noarch\
	pexpect\
	python-devel.x86_64\
	python-libs.i686\
	python-libs.x86_64\
	python-pip\
	python-setuptools\
	readline-devel.i686\
	readline-devel.x86_64\
	rpm-build\
	rpm-sign\
	rsync\
	tar\
	valgrind.i686\
	valgrind.x86_64\
	which\
# preserve uil32
 && dnf -y install motif-devel.i686\
 && mv /usr/bin/uil /usr/bin/uil32\
 && dnf -y install motif-devel.x86_64\
# globus header
 && ln -sf /usr/include/globus/* /usr/include/\
# install hdf5-devel
 && dnf -y install hdf5-devel.x86_64\
 && dnf download hdf5-devel.i686\
 && rpm -i --force --nodeps hdf5-devel*.rpm\
# install python2-numpy
 && dnf -y install numpy.x86_64\
 && dnf download numpy.i686\
 && rpm -i --force --nodeps numpy*.i686.rpm\
# pip
 && pip2 install --upgrade nose tap tap.py\
# cleanup
 && rm -rf ~\
 && rm -rf /tmp/*\
 && rm *.rpm\
 && dnf clean all
CMD /bin/bash
