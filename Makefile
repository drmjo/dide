# below are some default values to make
# the scripts work locally
REGISTRY?=docker.io/drmjo

# Fully Qualified Image Name
FQIN:=${REGISTRY}/${APP}:${VERSION}

# ide image
# IDE_IMAGE:=${REGISTRY}:k8s-${KUBECTL_VERSION}-helm-${HELM_VERSION}

# Generic build and push
build:
	docker build \
		-t ${FQIN} \
		--build-arg REGISTRY=${REGISTRY} \
		--build-arg SHA256SUM=${SHA256SUM} \
		--build-arg VERSION=${VERSION} \
		${APP}
push:
	docker push ${FQIN}

# IDE BUILD
build-ide:
	docker build \
		-t ${IDE_IMAGE} \
		--build-arg REGISTRY=${REGISTRY} \
		--build-arg KUBECTL_VERSION=${KUBECTL_VERSION} \
		--build-arg HELM_VERSION=${HELM_VERSION} \
		ide
push-ide:
	docker push ${IDE_IMAGE}