from multiarch/alpine:x86_64-v3.3

ADD mdsplus@mdsplus.org-589e05b6.rsa.pub /etc/apk/keys/
ADD inetd.conf /etc/
ADD mdsip_inetd /usr/bin/
ADD mdsip_server /usr/bin/
ADD start_mdsip /usr/bin/

RUN echo "http://www.mdsplus.org/dist/alpine/3.3/alpha" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "mdsip 8000/tcp" >> /etc/services; \
    apk update; \
    apk add alpine-keys
    
RUN apk add mdsplus-alpha-kernel
RUN apk add mdsplus-alpha-mitdevices mdsplus-alpha-rfxdevices mdsplus-alpha-w7xdevices
RUN apk add mdsplus-alpha-htsdevices

ENTRYPOINT ["start_mdsip"]
CMD []]



