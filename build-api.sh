#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

API_VERSION=$1

# Path to the codebase of tvster-api
API_BUILDPATH=$2
PUSH_IMAGES=false

# Build MySQL Docker image
# $DIR/app/mysql/image/build.sh

# Build API Docker image
echo "$API_BUILDPATH"
$DIR/app/tvster-api/image/build.sh $API_VERSION $API_BUILDPATH

if [ ${PUSH_IMAGES} = true ]; then
    $DIR/login-docker.sh

    # Exported from build scripts
    docker push $MYSQL_IMAGE
    docker push $API_IMAGE
fi