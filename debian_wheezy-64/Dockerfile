from debian:wheezy

RUN echo "deb http://mirrors.kernel.org/ubuntu lucid main multiverse" \
    	  > /etc/apt/sources.list.d/motif.list;\
    apt-get update; \
    apt-get install -y --force-yes \
                wget autoconf automake cvs gcc gfortran g++ libreadline-dev \
    	    	openjdk-7-jdk wget make rsync sudo pkg-config \
            	globus-common-progs libglobus-callout-dev \
		libglobus-gridmap-callout-error-dev \
		libglobus-gsi-credential-dev \
		libglobus-gsi-proxy-core-dev \
		libglobus-gss-assist-dev \
		libglobus-gssapi-gsi-dev \
		libglobus-xio-gsi-driver-dev  \
		freetds-dev libxml2-dev libcurl4-openssl-dev reprepro \
                libmotif-dev libxt-dev libxmu-dev libxp-dev libx11-dev; \
    apt-get -y upgrade; \
