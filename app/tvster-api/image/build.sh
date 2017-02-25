#!/bin/bash

usage() {
 echo "$0 <appname> <tag> <build-location>"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1
TAG=$2 || v1
BUILD_PATH=$3

if [ -z "$BUILD_PATH" ]; then
 LOCATION=./app/$APP
fi

cd $BUILD_PATH
./build-client.sh
cd $DIR
docker build --build-arg DB_URL=mysql://root:root@localhost:3306/tvster -t tvster/$APP:$TAG $BUILD_PATH
