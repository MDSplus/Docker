FROM alpine:3.6
LABEL maintainer="Stephen Lane-Walsh <slw@psfc.mit.edu>"

# Release channel flavor, 'stable' or 'alpha'
ARG MDSPLUS_FLAVOR=alpha

RUN apk add --update wget bash py-numpy python python3 openjdk8-jre fontconfig ttf-dejavu \
    && wget -P /etc/apk/keys/ http://www.mdsplus.org/dist/mdsplus@mdsplus.org-589e05b6.rsa.pub \
    && apk del wget \
    && echo "http://www.mdsplus.org/dist/alpine/3.6/${MDSPLUS_FLAVOR}" >> /etc/apk/repositories \
    && apk update \
    && (test "${MDSPLUS_FLAVOR} == alpha" \
        && apk add --update mdsplus-alpha-kernel mdsplus-alpha-python mdsplus-alpha-motif mdsplus-alpha-java \
        || apk add --update mdsplus-kernel mdsplus-python mdsplus-motif mdsplus-java) \
    && rm -rf /var/cache/apk/*

COPY envsyms /usr/local/mdsplus/local/envsyms
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
