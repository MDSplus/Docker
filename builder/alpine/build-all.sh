#!/bin/bash

docker run --rm --privileged multiarch/qemu-user-static:register --reset

docker build -t mdsplus/docker:alpine-3.9-armhf -f Dockerfile.3.9-armhf . &
docker build -t mdsplus/docker:alpine-3.9-x86 -f Dockerfile.3.9-x86 . &
docker build -t mdsplus/docker:alpine-3.9-x86_64 -f Dockerfile.3.9-x86_64 . &
