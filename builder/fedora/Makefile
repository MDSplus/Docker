OS_LIST=fc17 fc18 fc20 fc21 fc22 fc23 fc25 fc26 fc27 fc28 fc29 fc30

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:$@ -f Dockerfile-$@ .

