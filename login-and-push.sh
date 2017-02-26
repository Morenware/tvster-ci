#!/bin/bash

APP=$1
USERNAME=$2
PASSWORD=$3
TAG=$4

docker login --username=$USERNAME --password=$PASSWORD
docker tag tvster/$APP:$TAG dfernandez/tvster:$APP-$TAG
docker push dfernandez/tvster:$APP-$TAG
