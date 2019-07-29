#
# Usage:
#
# make [platforms] [push [nokeep]]  ### build the images for the listed platforms
#                                   ### or all if no list provided
#                                   ### if push provided push image to dockerhub
#                                   ### if push nokeep provided build, push and then remove image
# make [platforms] remove           ### Remove images locally 
#
OS_LIST = $(sort $(filter-out Makefile,$(wildcard *)))

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

$(OS_LIST):
	$(MAKE) -C $@ $(PUSH) $(REMOVE) $(NOKEEP)

push: $(GOALS)

nokeep:

remove: $(GOALS)

