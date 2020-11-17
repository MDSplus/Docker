#!/bin/sh
if test -z $1
then
  echo "usage: $0 <release>"
  echo "e.g.:  $0 30"
  exit 1
fi
target=$1
temp=$(mktemp -d)
docker run -v ${temp}:/target -e target -it --network=host fedora:20 /bin/sh -c "
mkdir /tmp/target
yum --installroot=/tmp/root --releasever=$target install -y --nogpgcheck fedora-release yum
rm -rf /tmp/root/var/cache/yum
tar -czf /target/image -C /tmp/root .
chmod +w /target/image
" && docker import $temp/image mdsplus/fedora:$target
rm -f $temp/image
rmdir $temp
