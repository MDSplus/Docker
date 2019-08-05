#!/bin/bash
set -e

. /etc/profile.d/mdsplus.sh

deluser hostuser >/dev/null 2>&1 || true
delgroup hostgroup >/dev/null 2>&1 || true

echo "Adding hostuser $UID:$GID"
addgroup -g $GID hostgroup
adduser -D -u $UID -G hostgroup hostuser

mdsip -s -p $MDSIP_PORT