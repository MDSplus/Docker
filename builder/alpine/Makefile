OS_LIST=3.9-x86 3.9-x86_64
ARM_LIST=3.9-armhf

.PHONY: all $(OS_LIST) $(ARM_LIST)
all: $(OS_LIST) $(ARM_LIST)

$(ARM_LIST) :
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build --no-cache -t mdsplus/builder:alpine-$@ -f Dockerfile.$@ .

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:alpine-$@ -f Dockerfile.$@ .

