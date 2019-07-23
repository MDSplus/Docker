OS_LIST=12-32 12-64 14-32 14-64 16-32 16-64 18-32 18-64

.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
	docker build --no-cache -t mdsplus/builder:ubuntu$@ -f Dockerfile-ub$@ .

