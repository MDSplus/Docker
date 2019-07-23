OS_LIST=windows

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:$@ .

