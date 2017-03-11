#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VERSION=$1
APP_NAME=tvster-organizer
PORT=9091

if [ -z "$VERSION" ]; then
  VERSION=$(cat $DIR/BUILD)
fi

echo "Running version $VERSION"
TAG=$APP_NAME-$VERSION
IMAGE_TO_PULL=dfernandez/tvster:$TAG

# Kill current container
docker rm $APP_NAME -f

# Start new one
docker run --name $APP_NAME -v /mediacenter:/mediacenter -p 9092:$PORT -d $IMAGE_TO_PULL
