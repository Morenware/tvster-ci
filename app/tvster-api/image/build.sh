#!/bin/bash

usage() {
 echo "$0 <appname> <tag> <build-location>"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=tvster-api
VERSION=$1
BUILD_PATH=$2
MYSQL_PASSWORD=$3 || ""
MYSQL_USER_PASS="root:$MYSQL_PASSWORD"

if [ -z ${MYSQL_PASSWORD} ]; then
    MYSQL_USER_PASS="root"
fi

export API_IMAGE=dfernandez/tvster:$APP-$VERSION

# Externalized config
mkdir -p ~/tvster/config

cd ${BUILD_PATH}
./build-client.sh
cp $BUILD_PATH/build/awsCreds.sh /tmp/

cd ${DIR}
docker build --build-arg DB_URL=mysql://${MYSQL_USER_PASS}@mysql:3306/tvster -t $API_IMAGE $BUILD_PATH
