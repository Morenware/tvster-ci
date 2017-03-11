#!/bin/bash

# tvster-api, mysql, tvster-organizer, tvster-organizer-base-rpi, tvster-organizer-base-x86
APP=$1

# Docker username and password, dfernandez/XXXX
USERNAME=$2
PASSWORD=$3

# Version
TAG=$4

docker login --username=$USERNAME --password=$PASSWORD
docker tag tvster/$APP:$TAG dfernandez/tvster:$APP-$TAG
docker push dfernandez/tvster:$APP-$TAG
