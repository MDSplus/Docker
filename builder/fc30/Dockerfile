from fedora:30

RUN dnf -y update --exclude=shadow-utils\
# ensure download
 && dnf -y install 'dnf-command(download)'\
# preserve python32
 && dnf -y install python2.i686\
 && mv /usr/bin/python2.7 /usr/bin/python2.7-i686\
 && dnf -y install python2.x86_64\
 && mv /usr/bin/python2.7 /usr/bin/python2.7-x86_64\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && dnf -y install\
	automake\
	binutils.x86_64\
	blas-devel.i686\
	blas-devel.x86_64\
	createrepo\
	dnf-plugins-core\
	freetds-devel.i686\
	freetds-devel.x86_64\
	gcc\
	gcc-c++\
	gcc-gfortran\
	gcc-gfortran.i686\
	gdb\
	gdb-gdbserver\
	git\
	glibc-devel.i686\
	glibc-devel.x86_64\
	globus-callout-devel.i686\
	globus-callout-devel.x86_64\
	globus-common-devel.i686\
	globus-common-devel.x86_64\
	globus-gridmap-callout-error-devel.i686\
	globus-gridmap-callout-error-devel.x86_64\
	globus-gsi-credential-devel.i686\
	globus-gsi-credential-devel.x86_64\
	globus-gsi-proxy-core-devel.i686\
	globus-gsi-proxy-core-devel.x86_64\
	globus-gssapi-error-devel.i686\
	globus-gssapi-error-devel.x86_64\
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
	java-1.8.0-openjdk-devel\
	libasan.i686\
	libasan.x86_64\
	libcurl-devel.i686\
	libcurl-devel.x86_64\
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
	libXt-devel.i686\
	libXt-devel.x86_64\
	make\
	nano\
	openssh-server\
	perl-Test-Harness.noarch\
	procps-ng\
	python2-pexpect\
	python2.x86_64\
	readline-devel.i686\
	readline-devel.x86_64\
	rpm-build\
	rpm-sign\
	rsync\
	strace\
	tar\
	valgrind\
	valgrind.i686\
	wget\
	which\
 && mv /usr/bin/python3.7m /usr/bin/python3.7-x86_64\
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
# pip
 && python2.7-i686 -m pip install numpy nose tap tap.py\
 && python2.7-x86_64 -m pip install numpy nose tap tap.py\
 && python3.7-x86_64 -m pip install numpy nose tap tap.py\
# set defaults
# package scripts will run on pyhton (64bit) as usual
# tests will run preferably on python3
# The 32bit build with use alternative python2 (32bit)
 && ln -sf python2.7-x86_64 /usr/bin/python\
 && ln -sf python3.7-x86_64 /usr/bin/python3.7\
 && ln -sf python2.7-i686   /usr/bin/python2.7\
 && ln -sf libpython3.7m.so.1.0 /lib64/libpython3.7.so\
 && ln -sf libpython2.7.so.1.0  /lib/libpython2.7.so\
# cleanup
 && rm -rf ~\
 && rm -rf /tmp/*\
 && rm *.rpm\
 && dnf clean all
CMD /bin/bash
