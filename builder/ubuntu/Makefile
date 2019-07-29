OS_LIST=12-32 12-64 14-32 14-64 16-32 16-64 18-32 18-64

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
	-docker rmi -f mdsplus/builder:ubuntu$@
else
	docker build --no-cache -t mdsplus/builder:ubuntu$@ -f Dockerfile-ub$@ .
  ifeq 'push' '$(PUSH)'
	docker push mdsplus/builder:ubuntu$@
    ifeq 'nokeep' '$(NOKEEP)'
	docker rmi -f mdsplus/builder:ubuntu$@
    endif
  endif
endif

push: $(GOALS)

remove: $(GOALS)

nokeep:
