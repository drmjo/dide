#!/bin/bash

set -euxo pipefail

# below are some default values to make
# the scripts work locally
REGISTRY=docker.io/drmjo

IMG=${REGISTRY}/${APP}
FQIN=${IMG}:${VERSION}

VERSION_SHORT=$(echo $VERSION | awk -F'.' '{print $1"."$2}')
FQIN_SHORT=${IMG}:${VERSION_SHORT}

docker build \
    -t ${FQIN} \
    -t ${FQIN_SHORT} \
    --build-arg REGISTRY=${REGISTRY} \
    --build-arg SHA256SUM=${SHA256SUM} \
    --build-arg AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    --build-arg VERSION=${VERSION} \
    ${APP}

docker push ${FQIN} ${FQIN_SHORT}