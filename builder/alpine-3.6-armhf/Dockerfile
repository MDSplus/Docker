#
# IMPORTANT:
#
# The following docker command is required to be run to enable the arm emulation in the host
# kernel. This must be run once after a reboot to enable docker to use the armhf images.
#
# docker run --rm --privileged multiarch/qemu-user-static:register --reset
#
FROM multiarch/alpine:armhf-v3.6

ENV JDK_DIR=/usr/lib/jvm/java-1.8-openjdk
RUN apk upgrade --update-cache --available\
# please dont just add packages but format them using this recipe:
# $list | tr ' ' '\n'| sort | uniq | sed -E 's/.*/\t\0\\/g'
 && apk add\
	alpine-sdk\
	automake\
	bash\
	binutils\
	curl\
	curl-dev\
	dev86\
	freetds-dev\
	g++\
	gcc\
	gfortran\
	git\
	lapack\
	lapack-dev\
	libdc1394\
	libdc1394-dev\
	libgcc\
	libgfortran\
	libraw1394\
	libraw1394-dev\
	libstdc++\
	libxml2\
	libxml2-dev\
	make\
	motif-dev\
	openjdk8\
	openjdk8-jre-lib\
	perl-test-harness\
	py2-pip\
	py-numpy\
	py-setuptools\
	python\
	python-dev\
	readline\
	readline-dev\
	rsync\
	tar\
	valgrind\
# pip
 && pip2 install --upgrade pip\
 && pip2 install nose tap tap.py\
# hdf5 and libquadmath if not armhf
#&& apk add libquadmath\
 && echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories\
 && apk add --update alpine-keys\
 && apk add --update hdf5 hdf5-dev\
 && ln -sf /usr/lib/bcc/include/sys/cdefs.h /usr/include/sys/\
# packaging
 && curl -s http://www.mdsplus.org/dist/mdsplus@mdsplus.org-589e05b6.rsa.pub\
  >                       /etc/apk/keys/mdsplus@mdsplus.org-589e05b6.rsa.pub\
# cleanup
 && rm -rf /var/cache/apk/*\
 && rm -rf /tmp/*\
 && rm -rf ~
CMD /bin/bash
