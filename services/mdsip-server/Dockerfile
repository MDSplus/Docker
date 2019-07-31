FROM mdsplus/mdsplus:mdsplus
LABEL maintainer="Stephen Lane-Walsh <slw@psfc.mit.edu>"

COPY mdsip.hosts /etc/mdsip.hosts
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8100-8200
ENV MDSIP_PORT 8100

ENTRYPOINT ["/entrypoint.sh"]