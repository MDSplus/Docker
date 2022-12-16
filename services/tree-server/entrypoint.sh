#!/bin/bash
set -e

. /usr/local/mdsplus/setup.sh

if [[ "x$default_tree_path" == "x" ]]; then
    export default_tree_path="/trees/~t/"
fi

deluser hostuser >/dev/null 2>&1 || true
delgroup hostgroup >/dev/null 2>&1 || true

echo "Adding hostuser $UID:$GID"
addgroup -g $GID hostgroup
adduser -D -u $UID -G hostgroup hostuser

inetd -fe
