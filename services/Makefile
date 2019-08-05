USER    := mdsplus
REPO    := mdsplus
BRANCH  ?= alpha
# Change tag used in next line to match ${USER}/${REPO}:mdsplus if USER or REPO is changed
RELEASE = $(docker run --rm mdsplus/mdsplus:mdsplus mdstcl show version | grep 'version:' | cut -d ' ' -f 3)

.PHONY: all
all: tree-server mdsip-server

.PHONY: mdsplus
mdsplus:
	docker build --no-cache --build-arg MDSPLUS_FLAVOR=$(value BRANCH) -t ${USER}/${REPO}:mdsplus mdsplus
	docker tag ${USER}/${REPO}:mdsplus ${USER}/${REPO}:$(value BRANCH)
	docker tag ${USER}/${REPO}:mdsplus ${USER}/${REPO}:$(value BRANCH)-$(value RELEASE)
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:$(value BRANCH) ${USER}/${REPO}:latest
endif

.PHONY: tree-server
tree-server: mdsplus
	docker build --no-cache -t ${USER}/${REPO}:tree-server-$(value BRANCH) tree-server
	docker tag ${USER}/${REPO}:tree-server-$(value BRANCH) ${USER}/${REPO}:tree-server-$(value BRANCH)-$(value RELEASE)
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:tree-server-$(value BRANCH) ${USER}/${REPO}:tree-server-latest
endif

.PHONY: mdsip-server
mdsip-server: mdsplus
	docker build --no-cache -t ${USER}/${REPO}:mdsip-server-$(value BRANCH) mdsip-server
	docker tag ${USER}/${REPO}:mdsip-server-$(value BRANCH) ${USER}/${REPO}:mdsip-server-$(value BRANCH)-$(value RELEASE)
ifeq 'alpha' '$(BRANCH)'
	docker tag ${USER}/${REPO}:mdsip-server-$(value BRANCH) ${USER}/${REPO}:mdsip-server-latest
endif

.PHONY: push
push: mdsplus tree-server mdsip-server
	docker push ${USER}/${REPO}:$(value BRANCH)
	docker push ${USER}/${REPO}:tree-server-$(value BRANCH)
	docker push ${USER}/${REPO}:mdsip-server-$(value BRANCH)
	docker push ${USER}/${REPO}:$(value BRANCH)-$(value RELEASE)
	docker push ${USER}/${REPO}:tree-server-$(value BRANCH)-$(value RELEASE)
	docker push ${USER}/${REPO}:mdsip-server-$(value BRANCH)-$(value RELEASE)
ifeq 'alpha' '$(BRANCH)'
	docker push ${USER}/${REPO}:latest
	docker push ${USER}/${REPO}:tree-server-latest
	docker push ${USER}/${REPO}:mdsip-server-latest
endif

.PHONY: rmi
rmi:
	docker images | grep ${USER}/${REPO} | awk '{system("docker rmi -f "$$3)}'
