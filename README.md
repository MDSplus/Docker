# Dockerized MDSplus

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
