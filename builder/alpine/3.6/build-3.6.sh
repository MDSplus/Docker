#!/bin/bash

docker run --rm --privileged multiarch/qemu-user-static:register --reset
build() {
docker build -t mdsplus/docker:alpine-3.6-$1 -f Dockerfile.3.6-$1 . &> build.3.6-$1.log
}

build x86    &
build x86_64 &
build armhf  &
