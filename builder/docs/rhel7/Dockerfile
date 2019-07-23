FROM mdsplus/docker:rhel7

# To build docker image:
#
#

# ENV http_proxy 'eproxy2.rfx.local:8080'
# ENV https_proxy 'eproxy2.rfx.local:8080'

COPY build_* /usr/local/bin/

RUN yum install -y doxygen \
    graphviz \
    ghostscript \
    texlive \
    texlive-latex \
    texlive-xtab \
    texlive-multirow \
    texlive-sectsty \
    texlive-tocloft \
    texlive-epstopdf \
    xorg-fonts-100dpi \
    xorg-fonts-100dpi \
    dejavu-fonts-common.noarch \
    dejavu-sans-fonts.noarch \
    dejavu-sans-mono-fonts.noarch \
    dejavu-serif-fonts.noarch



ENTRYPOINT ["build_mdsplus"]
