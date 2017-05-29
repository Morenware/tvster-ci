#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MYSQL_IMAGE=dfernandez/tvster:mysql-5.6
API_VERSION=$(cat ${DIR}/app/tvster-api/BUILD)
API_IMAGE=dfernandez/tvster:tvster-api-${API_VERSION}

$DIR/login-docker.sh
docker push $MYSQL_IMAGE
docker push $API_IMAGE