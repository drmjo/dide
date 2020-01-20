#!/bin/bash

set -exo pipefail

# below are some default values to make
# the scripts work locally
REGISTRY=docker.io/drmjo

IMG=${REGISTRY}/${APP}
FQIN=${IMG}:${VERSION}
TAGS="-t ${FQIN}"

VERSION_REGEX="^([0-9]+\.[0-9]+)\.([0-9]+)$"

# check if the version can be shortened
# i.e. 1.16.7 will be converted into 1.16
if [[ $VERSION =~ $VERSION_REGEX ]]; then
    echo "Version needs to be shortened"
    VERSION_SHORT=${BASH_REMATCH[1]}
    FQIN_SHORT=${IMG}:${VERSION_SHORT}
    TAGS+=" -t ${FQIN_SHORT}"
fi

echo $FQIN_SHORT
echo $VERSION_SHORT
echo $TAGS

docker build \
    ${TAGS} \
    --build-arg REGISTRY=${REGISTRY} \
    --build-arg SHA256SUM=${SHA256SUM} \
    --build-arg AWS_CLI_VERSION=${AWS_CLI_VERSION} \
    --build-arg VERSION=${VERSION} \
    ${APP}

docker push ${FQIN}

# push short version too if FQIN_SHORT is set
[[ -n ${FQIN_SHORT} ]] && docker push ${FQIN_SHORT}