#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION=$1
APP_NAME=tvster-api
PORT=4000

if [ -z "$VERSION" ]; then
  VERSION=$(cat $DIR/BUILD)
fi

echo "Running version $VERSION"
TAG=$APP_NAME-$VERSION
IMAGE_TO_PULL=dfernandez/tvster:$TAG

# Kill current container
docker rm tvster-api -f

# Start new one
docker run --name tvster-api --link tvster-mysql:mysql -p 80:$PORT -d $IMAGE_TO_PULL


