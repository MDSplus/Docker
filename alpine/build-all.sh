#!/bin/bash

docker build -t mdsplus/docker:alpine-3.3-armhf -f Dockerfile.3.3-armhf . &
docker build -t mdsplus/docker:alpine-3.3-x86 -f Dockerfile.3.3-x86 . &
docker build -t mdsplus/docker:alpine-3.3-x86_64 -f Dockerfile.3.3-x86_64 . &
docker build -t mdsplus/docker:alpine-3.9-armhf -f Dockerfile.3.3-armhf . &
docker build -t mdsplus/docker:alpine-3.9-x86 -f Dockerfile.3.3-x86 . &
docker build -t mdsplus/docker:alpine-3.9-x86_64 -f Dockerfile.3.3-x86_64 . &
