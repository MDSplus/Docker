#
# Usage:
#
# make [target] [push [nokeep]]  ### build the images for the listed platforms
#                                ### or all if no list provided
#                                ### if push provided push image to dockerhub
#                                ### if push nokeep provided build, push and then remove image
# make [target] remove           ### Remove images locally 
#

# For arm* builds on amd64, make sure you have the qemu-user-static package installed

DOCKERFLAGS ?=

CMAKE_VERSION ?= 3.31.5

SKIP_FILES := $(wildcard Makefile*) EOL bootstrap raspberrypi-32
OS_LIST := bootstrap $(sort $(filter-out $(SKIP_FILES),$(wildcard *))) raspberrypi-32

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
	@if [ -r $@/Makefile ]; then make -C $@ $(REMOVE) $(PUSH) $(NOKEEP); \
	else \
	  if [ -r $@/Dockerfile ]; then \
	    TAG=mdsplus/builder:$@; \
	    if [ ! -z "$(REMOVE)" ]; then docker rmi -f $$TAG || :; \
	    else \
	      docker build $(DOCKERFLAGS) --build-arg CMAKE_VERSION=$(CMAKE_VERSION) --no-cache -t $$TAG $@; \
	      if [ ! -z "$(PUSH)" ]; then \
	        docker push $$TAG; \
	        if [ ! -z "$(NOKEEP)" ]; then \
	          docker rmi -f $$TAG; \
	        fi; \
	      fi; \
	    fi; \
	  fi; \
	fi

push: $(GOALS)
	@:

nokeep:

remove: $(GOALS)

show:
	echo $(OS_LIST)
