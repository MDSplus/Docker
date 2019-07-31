FROM mdsplus/mdsplus:mdsplus
LABEL maintainer="Stephen Lane-Walsh <slw@psfc.mit.edu>"

COPY services /etc/services
COPY inetd.conf /etc/inetd.conf
COPY mdsip.hosts /etc/mdsip.hosts
COPY entrypoint.sh /entrypoint.sh

ENV UID 1000
ENV GID 1000

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]