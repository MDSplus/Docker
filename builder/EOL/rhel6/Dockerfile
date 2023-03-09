from centos:6

# repo has basearch i386 however contains i686 -> manually add repo info
RUN export repo=/etc/yum.repos.d/devtools-2.repo\
 && echo '[devtools-2-32]' > $repo\
 && echo 'name=devtools-2-32' >> $repo\
 && echo 'baseurl=http://people.centos.org/tru/devtools-2/6/i386/RPMS' >> $repo\
 && echo 'gpgcheck=0' >> $repo\
 && echo '[devtools-2-64]' >> $repo\
 && echo 'name=devtools-2-64' >> $repo\
 && echo 'baseurl=http://people.centos.org/tru/devtools-2/6/x86_64/RPMS' >> $repo\
 && echo 'gpgcheck=0' >> $repo\
 && yum -q -y install epel-release\
 && yum -q clean all\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && yum -q -y install\
	automake\
	blas-devel\
	blas-devel.i686\
	createrepo\
	devtoolset-2-binutils\
	devtoolset-2-gcc\
	devtoolset-2-gcc-c++\
	devtoolset-2-gcc-gfortran\
	devtoolset-2-libquadmath-devel\
	devtoolset-2-libquadmath-devel.i686\
	devtoolset-2-libstdc++-devel\
	devtoolset-2-libstdc++-devel.i686\
	freetds-devel\
	freetds-devel.i686\
	gdb\
	gdb-gdbserver\
	git\
	glibc-devel\
	glibc-devel.i686\
	globus-callout-devel\
	globus-callout-devel.i686\
	globus-common-progs\
	globus-gridmap-callout-error-devel\
	globus-gridmap-callout-error-devel.i686\
	globus-gsi-credential-devel\
	globus-gsi-credential-devel.i686\
	globus-gsi-proxy-core-devel\
	globus-gsi-proxy-core-devel.i686\
	globus-gssapi-gsi-devel\
	globus-gssapi-gsi-devel.i686\
	globus-gss-assist-devel\
	globus-gss-assist-devel.i686\
	globus-xio-gsi-driver-devel\
	globus-xio-gsi-driver-devel.i686\
	hdf5-devel\
	hdf5.i686\
	java7-devel\
	libasan.i686\
	libasan.x86_64\
	libcurl-devel\
	libcurl-devel.i686\
	libdc1394-devel\
	libdc1394-devel.i686\
	libgfortran.i686\
	libraw1394-devel\
	libraw1394-devel.i686\
	libtsan.x86_64\
	libX11-devel\
	libX11-devel.i686\
	libxml2-devel\
	libxml2-devel.i686\
	numpy\
	openmotif-devel.i686\
	openssh\
	openssh-server\
	perl-Test-Harness\
	pexpect\
	python-devel\
	python-libs.i686\
	python-pip\
	python-setuptools\
	readline-devel\
	readline-devel.i686\
	rpm-build\
	rsync\
	tar\
	valgrind\
	valgrind.i686\
	which\
	yum-utils\
	zlib-devel\
	zlib-devel.i686\
 && mv /usr/bin/uil /usr/bin/uil32\
 && yum -q -y install openmotif-devel.x86_64 libXt-devel.x86_64\
 && yum -q -y install /usr/bin/yumdownloader\
 && yumdownloader\
	freetds-devel.i686\
	freetds.i686\
	globus-*.i686\
	hdf5-devel.i686\
	hdf5.i686\
	libraw1394-devel.i686\
 	libraw1394.i686\
	libdc1394-devel.i686\
	libdc1394.i686 libdc1394-devel.i686\
 && rpm -i --nodeps --force *.rpm\
# Install cpanminus installer for perl and upgrade TAP::Parser
 && curl -L http://cpanmin.us | perl - --self-upgrade\
 && cpanm TAP::Parser\
# pip 
 && pip2 install --upgrade nose tap tap.py\
 && pip2 install importlib\
 && echo . /opt/rh/devtoolset-2/enable >> /etc/profile\
# cleanup
 && rm -rf ~\
 && rm -rf /tmp/*\
 && rm *.rpm\
 && yum clean all
CMD /bin/bash
