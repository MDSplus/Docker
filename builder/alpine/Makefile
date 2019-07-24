OS_LIST=3.9-x86 3.9-x86_64 3.9-armhf

PUSH=$(findstring push,$(MAKECMDGOALS))
NOKEEP=$(findstring nokeep,$(MAKECMDGOALS))
REMOVE=$(findstring remove,$(MAKECMDGOALS))

ifeq 'push' '$(filter-out nokeep,$(MAKECMDGOALS))'
GOALS=$(OS_LIST)
endif

ifeq 'remove' '$(MAKECMDGOALS)'
GOALS=$(OS_LIST)
endif


.PHONY: all $(OS_LIST)
all: $(OS_LIST)

$(OS_LIST) :
ifeq 'remove' '$(REMOVE)'
	-docker rmi -f mdsplus/builder:alpine-$@
else
	if [ '$(findstring arm,$(value @))' == 'arm' ]; then \
	   docker run --rm --privileged multiarch/qemu-user-static:register --reset; \
        fi
	docker build --no-cache -t mdsplus/builder:alpine-$@ -f Dockerfile.$@ .
  ifeq 'push' '$(PUSH)'
	docker push mdsplus/builder:alpine-$@
    ifeq 'nokeep' '$(NOKEEP)'
	docker rmi -f mdsplus/builder:alpine-$@
    endif
  endif
endif

push: $(GOALS)

remove: $(GOALS)

nokeep:
