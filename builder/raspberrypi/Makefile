OS_LIST=raspi-ub14-32

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

raspi-ub14-32 :
	docker build --no-cache -t mdsplus/builder:raspberrypi-32 -f Dockerfile-$@ .

