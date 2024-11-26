# Docker Images for the MDSplus Build System

The build scripts use Docker images that contain all the tools and packages needed to compile MDSplus, test it, and make the release packages.

The images are kept on Docker Hub under `mdsplus/builder`.  Each image is tagged according to this convention: os-version-architecture.  For example:
- alpine-3.9-armhf
- alpine-3.9-x86
- alpine-3.9-x86_64

Note that although Docker Hub has the ability to bundle all those images together and refer to them simply as "mdsplus/builder:alpine-3.9" (aka a multi-architecture image), that feature is not used.  For simplicity, it is just easier to give a unique tag to every image.

Developers will often run the build scripts directly (`mdsplus/deploy/build.sh`).   However, the Jenkins build sever also runs the same build scripts.   Jenkins is also responsible for building the Docker images and storing them on Docker Hub.

The Jenkins server is x86_64 and most of the MDSplus releases are also for x86_64.  For the non-x86 architectures, Jenkins either builds using the QEMU emulation or triggers a build on another server of the approriate architecture (e.g., Raspberry Pi, Mac mini M2).

## QEMU

When a x86_64 system is using QEMU to build a non-x86 image, the following command must be run at least once after the system is rebooted.

`docker run --rm --privileged multiarch/qemu-user-static:register --reset`

Dockerfiles for non-x86 images also have to be configured to use QEMU.  That involves a FROM and COPY statement (look for `qemu` in the Dockerfile).

For more details on QEMU, visit [https://www.qemu.org](https://www.qemu.org)

### Note

As of 9-Jun-2023, there are two ways to specify QEMU in a Dockerfile.   
- The original approach is to use the `multiarch/*` images from Docker Hub.  These images work well but lag the official Linux releases by several versions.
- The newer approach is to use the official Linux release images from Docker Hub and explicitly add the QEMU emulator by using FROM and COPY statements in the Dockerfile.   If this approach works well, all QEMU related Dockerfiles will be converted to the new approach.

## ARM

MDSplus supports several ARM platforms:
- armhf = 32-bit ARM with hardware floating point (aka arm7l)
- aarch64 = 64-bit ARM (also known as arm64)
- Apple Silicon M1 / M2 = 64-bit ARM with Apple's custom features

Note that "armhf" is used with 32-bit Raspberry Pi devices.   The "armhf" is a name created by Debian Linux to refer to arm7 devices that have the Thumb-2 and VFP3D16 instruction sets.  The "armhf" name is not an official name from ARM Ltd.

Although there are some 64-bit ARM cpus that also can run 32-bit code, the Apple Silicon cpus (M1 and M2) do not.   This means that a virtual machine or Docker container hosted on an M1 or M2 cpu, probably won't be able to run code written for a 32-bit Raspberry Pi.

Jenkins runs some ARM images on a Raspberry Pi and some on a Mac mini M2.   

Developers with x86 workstations can run the ARM images using QEMU, but it can take over an hour to build MDSplus.  If using an ARM CPU, it only takes a few minutes to build MDSplus.

And if using an ARM CPU to create experimental Docker images for local use, can comment out the two `qemu` lines in the Dockerfile.  (However, it does no harm to leave the two lines uncommented.)

## MacOS

*!!! To Do:  will write this section after have MacOS builds working on Apple Silicon (M1 / M2). !!!*

Questions:
- Support MDSplus on both Intel Macs and Apple Silicon Macs?
- If so, is there an Intel Mac available for the Jenkins build system?
- How long to support MDSplus on Intel Macs?
- Note: M1 was introduced in November 2020, last Intel Mac was discontinued in June 2023



# Dockerized MDSplus

***!!! 8-Jun-2023: This entire section needs to be reviewed. !!!***

[https://hub.docker.com/r/mdsplus/mdsplus](https://hub.docker.com/r/mdsplus/mdsplus)

## How to use these images
These images are provided as a means to use the MDSplus data management software in several different ways. The base mdsplus image is to be used for tools or as a base for images built on it. The tree-server image is to be used for creating multi-client mdsip servers, mostly used for serving tree files. The mdsip server is to be used for single-client mdsip servers, used for running tasks that should not be done in parallel.

### The mdsplus image
This image contains an install of MDSplus and an entrypoint script that sources the MDSplus setup.sh and then runs whatever command is given. To use it, either run it directly with the command you want, or mount in the X environment to run graphical applications.

```
docker run -d --name scope --rm -it --env=DISPLAY --env=QT_X11_NO_MITSHM=1 \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw mdsplus/mdsplus:latest dwscope
```

### The tree-server image
This image extends the base mdsplus image, with the addition of a simple inetd configuration for serving multiple connections. To use it, map port 8000 to your host and run the normal MDSplus applications against it, or built it as part of a compose and have the other applications reference it. Trees should be mounted into `/trees/`, and the default_tree_path is configured to `/trees/~t/` by default.
*Note* As this server reads/writes files likely mounted to the host computer, you must specify a UID and GID for the server to map incoming users to.

```
version: "3.3"
services:
  tree_server:
    image: "mdsplus/mdsplus:tree-server"
    environment:
      - "UID=${UID}"
      - "GID=${GID}"
    volumes:
      - ./trees:/trees
    ports:
      - "8000:8000"
```

### The mdsip image
This image extends the base mdsplus image, with the addition of an entrypoint script that will run an mdsip server on the port specified by `MDSIP_PORT`. This should be used in creating servers to handle explicit tasks, such as dispatch, daq, or analysis servers.
*Note* As this server maps incoming users to internal users, you must specify a UID/GID for the server to map them to.

```
version: "3.3"
services:
  dispatch_server:
    image: "mdsplus/mdsplus:mdsip-server"
    environment:
      - "default_tree_path=tree_server::"
    environment:
      - "MDSIP_PORT=8101"
      - "UID=${UID}"
      - "GID=${GID}"
    ports:
      - "8101:8101"
```

## Building

```shell
export RELEASE="<MDSplus version>"
export BRANCH="<alpha|stable>"
make
# or
make mdsplus
# or
make tree-server
# or
make mdsip-server
```

## Publishing

```shell
make push
```
