FROM mdsplus/docker:centos7

# To build docker image:
#
#

# ENV http_proxy 'eproxy2.rfx.local:8080'
# ENV https_proxy 'eproxy2.rfx.local:8080'

RUN yum install -y doxygen \
    graphviz \
    ghostscript \
    texlive \
    texlive-latex \
    texlive-xtab \
    texlive-multirow \
    texlive-sectsty \
    texlive-tocloft \
    texlive-epstopdf


COPY build_* /usr/local/bin/

ENTRYPOINT ["build_mdsplus"]
