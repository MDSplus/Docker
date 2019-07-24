OS_LIST=wheezy-32 wheezy-64

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
	docker rmi -f mdsplus/builder:debian_$@
else
	docker build --no-cache -t mdsplus/builder:debian_$@ -f Dockerfile-$@ .
  ifeq 'push' '$(PUSH)'
	docker push mdsplus/builder:debian_$@
    ifeq 'nokeep' '$(NOKEEP)'
	docker rmi -f mdsplus/builder:debian_$@
    endif
  endif
endif

push: $(GOALS)

remove: $(GOALS)

nokeep:
