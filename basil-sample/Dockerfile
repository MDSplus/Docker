# To USE this file:

## This was a minimalist fedora called 'myfedora:v1' created using:
#yum --installroot=/root/fedroot --releasever=20 install yum fedora-release-20 coreutils
#cd /root/fedroot/
#rm -rf ./var/cache/yum/* ./var/lib/yum/yumdb/* ./var/lib/yum/history/* ./var/log/yum.log
#tar -czf - . | docker import - myfedora:v1

## Build the Mdsplus distribution onto myfedora:v1 using this file
# docker build -t "myfedora:MdsPlus" .

# try image out running sh (no bash as yet !)
##docker run -t -i myfedora:MdsPlus /bin/sh
# Run with a shared directory in the /dshare mounted in /opt/dshare
##docker run -i -t -v /dshare:/opt/dshare -t myfedora:MdsPlus /bin/bash

FROM fedora:20

MAINTAINER Basil P. DUVAL, version: 0.1

# Install rpmfusion updates
RUN yum -y install yum-plugin-fastestmirror
RUN yum -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
RUN yum -y update rpmfusion\*
RUN yum -y update
RUN yum -y install vim-minimal procps-ng nmap openssh-clients rsync bash

#Install MdsPlus
RUN yum -y install --nogpgcheck http://www.mdsplus.org/dist/fc20/stable/RPMS/x86_64/mdsplus-repo-6.1-19.fc20.x86_64.rpm
RUN yum -y update
RUN yum -y install mdsplus
RUN yum -y install xinetd

#Get links for tdic to work
RUN ln -sf /usr/lib64/libreadline.so.6 /usr/lib64/libreadline.so
RUN ln -sf /usr/lib64/libhistory.so.6 /usr/lib64/libhistory.so

# Expose the mdsip socket to machines outside the docker task
EXPOSE 8000

#. /usr/local/mdsplus/setup.sh

#remove yum history
RUN rm -rf ./var/cache/yum/* ./var/lib/yum/yumdb/* ./var/lib/yum/history/* ./var/log/yum.log

## if you create an additional image (use docker ps -a to get xxxxxxxxxx)
# docker commit xxxxxxxxxx myfedora:MdsPlus1
