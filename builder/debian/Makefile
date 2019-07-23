OS_LIST=wheezy-32 wheezy-64

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:debian_$@ -f Dockerfile-$@ .

