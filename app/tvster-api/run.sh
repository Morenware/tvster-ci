#!/bin/bash

APP_NAME=tvster-api
VERSION=$1
TAG=$APP_NAME-$VERSION
IMAGE_TO_PULL=dfernandez/tvster:$TAG
PORT=4000
docker run --name tvster-api --link tvster-mysql:mysql -p 80:$PORT -d $IMAGE_TO_PULL


