OS_CATEGORIES = alpine debian docs fedora raspberrypi rhel ubuntu windows

.PHONY: all $(OS_CATEGORIES)
all: $(OS_CATEGORIES)

$(OS_CATEGORIES):
	$(MAKE) -C $@

