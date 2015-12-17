FROM dock0/arch:latest

# ENV http_proxy 'eproxy2.rfx.local:8080'
# ENV https_proxy 'eproxy2.rfx.local:8080'

COPY build_* /usr/local/bin/

RUN pacman -Sy --noconfirm; \
    pacman -S --noconfirm \
    rsync wget git tar gzip awk\
    gcc make \
    doxygen \
    graphviz \
    extra/xorg-fonts-100dpi extra/xorg-fonts-75dpi extra/ttf-dejavu \
    extra/texlive-core \
    extra/texlive-latexextra \
    extra/texlive-science \
    ghostscript


ENTRYPOINT ["build_mdsplus"]
