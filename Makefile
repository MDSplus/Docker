
USER    := mdsplus
REPO    := mdsplus
BRANCH  ?= alpha
RELEASE ?= $(shell mdstcl show version | grep 'version:' | cut -d ' ' -f 3)

.PHONY: all
all: tree-server mdsip-server

.PHONY: mdsplus
mdsplus: mdsplus-${BRANCH}

.PHONY: mdsplus-stable
mdsplus-stable:
	cd mdsplus; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=stable \
		-t ${USER}/${REPO}:stable .
	docker tag ${USER}/${REPO}:stable ${USER}/${REPO}:${RELEASE}

.PHONY: mdsplus-alpha
mdsplus-alpha:
	cd mdsplus; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=alpha \
		-t ${USER}/${REPO}:alpha .
	docker tag ${USER}/${REPO}:alpha ${USER}/${REPO}:latest
	docker tag ${USER}/${REPO}:alpha ${USER}/${REPO}:${RELEASE}

.PHONY: tree-server
tree-server: tree-server-${BRANCH}

.PHONY: tree-server-stable
tree-server-stable: mdsplus-stable
	cd tree-server; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=stable \
		-t ${USER}/${REPO}:tree-server-stable .
	docker tag ${USER}/${REPO}:tree-server-stable ${USER}/${REPO}:${RELEASE}-tree-server

.PHONY: tree-server-alpha
tree-server-alpha: mdsplus-alpha
	cd tree-server; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=alpha \
		-t ${USER}/${REPO}:tree-server-alpha .
	docker tag ${USER}/${REPO}:tree-server-alpha ${USER}/${REPO}:tree-server
	docker tag ${USER}/${REPO}:tree-server-alpha ${USER}/${REPO}:${RELEASE}-tree-server

.PHONY: mdsip-server
mdsip-server: mdsip-server-${BRANCH}

.PHONY: mdsip-server-stable
mdsip-server-stable: mdsplus-stable
	cd mdsip-server; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=stable \
		-t ${USER}/${REPO}:mdsip-server-stable .
	docker tag ${USER}/${REPO}:mdsip-server-stable ${USER}/${REPO}:${RELEASE}-mdsip-server

.PHONY: mdsip-server-alpha
mdsip-server-alpha: mdsplus-alpha
	cd mdsip-server; docker build --no-cache \
		--build-arg MDSPLUS_FLAVOR=alpha \
		-t ${USER}/${REPO}:mdsip-server-alpha .
	docker tag ${USER}/${REPO}:mdsip-server-alpha ${USER}/${REPO}:mdsip-server
	docker tag ${USER}/${REPO}:mdsip-server-alpha ${USER}/${REPO}:${RELEASE}-mdsip-server

.PHONY: push
push: push-${BRANCH}

.PHONY: push-stable
push-stable:
	docker push ${USER}/${REPO}:stable
	docker push ${USER}/${REPO}:tree-server-stable
	docker push ${USER}/${REPO}:mdsip-server-stable
	docker push ${USER}/${REPO}:${RELEASE}
	docker push ${USER}/${REPO}:${RELEASE}-tree-server
	docker push ${USER}/${REPO}:${RELEASE}-mdsip-server

.PHONY: push-alpha
push-alpha:
	docker push ${USER}/${REPO}:latest
	docker push ${USER}/${REPO}:alpha
	docker push ${USER}/${REPO}:tree-server
	docker push ${USER}/${REPO}:tree-server-alpha
	docker push ${USER}/${REPO}:mdsip-server
	docker push ${USER}/${REPO}:mdsip-server-alpha
	docker push ${USER}/${REPO}:${RELEASE}
	docker push ${USER}/${REPO}:${RELEASE}-tree-server
	docker push ${USER}/${REPO}:${RELEASE}-mdsip-server

.PHONY: rmi
rmi:
	docker rmi ${USER}/${REPO}:latest \
		${USER}/${REPO}:stable \
		${USER}/${REPO}:alpha \
		${USER}/${REPO}:tree-server \
		${USER}/${REPO}:tree-server-stable \
		${USER}/${REPO}:tree-server-alpha \
		${USER}/${REPO}:mdsip-server \
		${USER}/${REPO}:mdsip-server-stable \
		${USER}/${REPO}:mdsip-server-alpha \
		${USER}/${REPO}:${RELEASE} \
		${USER}/${REPO}:${RELEASE}-tree-server \
		${USER}/${REPO}:${RELEASE}-mdsip-server
