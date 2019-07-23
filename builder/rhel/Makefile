OS_LIST=rhel5 rhel6 rhel7

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:$@ -f Dockerfile-$@ .
