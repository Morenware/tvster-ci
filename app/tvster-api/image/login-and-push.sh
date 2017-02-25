#!/bin/bash

APP=$1
TAG=$2 || v1

docker login
docker tag tvster/$APP:$TAG dfernandez/tvster:$APP-$TAG
docker push dfernandez/tvster:$APP-$TAG
