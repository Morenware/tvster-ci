#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

API_VERSION=$(cat ${DIR}/app/tvster-api/BUILD)

# Path to the codebase of tvster-api
API_BUILDPATH=$1
PUSH_IMAGES=true

# Build MySQL Docker image
echo "Building MySQL image..."
$DIR/app/mysql/image/build.sh

# Build API Docker image
echo "Building API version $API_VERSION from build path $API_BUILDPATH"
$DIR/app/tvster-api/image/build.sh ${API_VERSION} ${API_BUILDPATH}

if [ ${PUSH_IMAGES} = true ]; then
    $DIR/push-api-images.sh
fi