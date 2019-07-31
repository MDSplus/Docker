
USER    := mdsplus
REPO    := mdsplus
BRANCH  ?= alpha

.PHONY: all
all: tree-server mdsip-server

.PHONY: mdsplus

.ONESHELL:
mdsplus:
	cd mdsplus; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=$(value BRANCH) \
		-t ${USER}/${REPO}:mdsplus .
	RELEASE=$$(docker run -t --rm ${USER}/${REPO}:mdsplus mdstcl show version | grep 'version:' | cut -d ' ' -f 3)
	RELEASE=$${RELEASE:0:-1}
	docker tag ${USER}/${REPO}:mdsplus ${USER}/${REPO}:$(value BRANCH)
	docker tag ${USER}/${REPO}:mdsplus ${USER}/${REPO}:$(value BRANCH)-$$RELEASE
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:$(value BRANCH) ${USER}/${REPO}:latest
endif


.PHONY: tree-server
.ONESHELL:
tree-server: mdsplus
	cd tree-server; docker build --no-cache \
		-t ${USER}/${REPO}:tree-server-$(value BRANCH) .
	RELEASE=$$(docker run -t --rm ${USER}/${REPO}:$(value BRANCH) mdstcl show version | grep 'version:' | cut -d ' ' -f 3)
	RELEASE=$${RELEASE:0:-1}
	docker tag ${USER}/${REPO}:tree-server-$(value BRANCH) ${USER}/${REPO}:$(value BRANCH)-$$RELEASE-tree-server
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:tree-server-$(value BRANCH) ${USER}/${REPO}:latest-tree-server
endif

.PHONY: mdsip-server

.ONESHELL:
mdsip-server: mdsplus
	cd mdsip-server; docker build --no-cache \
		-t ${USER}/${REPO}:mdsip-server-$(value BRANCH) .
	RELEASE=$$(docker run -t --rm ${USER}/${REPO}:$(value BRANCH) mdstcl show version | grep 'version:' | cut -d ' ' -f 3)
	RELEASE=$${RELEASE:0:-1}
	docker tag ${USER}/${REPO}:mdsip-server-$(value BRANCH) ${USER}/${REPO}:$(value BRANCH)-$$RELEASE-mdsip-server
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:mdsip-server-$(value BRANCH) ${USER}/${REPO}:latest-mdsip-server
endif

.PHONY: push

.ONESHELL:
push: mdsplus tree-server mdsip-server
	RELEASE=$$(docker run -t --rm ${USER}/${REPO}:$(value BRANCH) mdstcl show version | grep 'version:' | cut -d ' ' -f 3)
	RELEASE=$${RELEASE:0:-1}
	docker push ${USER}/${REPO}:$(value BRANCH)
	docker push ${USER}/${REPO}:tree-server-$(value BRANCH)
	docker push ${USER}/${REPO}:mdsip-server-$(value BRANCH)
	docker push ${USER}/${REPO}:$(value BRANCH)-$$RELEASE
	docker push ${USER}/${REPO}:$(value BRANCH)-$$RELEASE-tree-server
	docker push ${USER}/${REPO}:$(value BRANCH)-$$RELEASE-mdsip-server
ifeq 'alpha' '$(BRANCH)'
	docker push ${USER}/${REPO}:latest
	docker push ${USER}/${REPO}:latest-tree-server
	docker push ${USER}/${REPO}:latest-mdsip-server
endif

.PHONY: rmi
rmi:
	docker images | grep ${USER}/${REPO} | awk '{system("docker rmi -f "$$3)}'
