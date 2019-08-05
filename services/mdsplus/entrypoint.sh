#!/bin/bash
set -e

. /etc/profile.d/mdsplus.sh

if [[ "x$default_tree_path" == "x" ]]; then
    export default_tree_path="/trees/~t/"
fi

$@
