#!/bin/bash

usage() {
 echo "$0 <appname> <tag> <build-location>"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1
TAG=$2 || v1
BUILD_PATH=$3

if [ -z "$BUILD_PATH" ]; then
 BUILD_PATH=./app/$APP
fi

# Multiple Dockerfiles
if [ -f "$DIR/Dockerfile" ]; then
    # Change Dockerfile
    mv $BUILD_PATH/Dockerfile $DIR/Dockerfile-previous
    cp $DIR/Dockerfile $BUILD_PATH
fi

echo "Building Dockerfile:"
cat $BUILD_PATH/Dockerfile

docker build -t tvster/$APP:$TAG $BUILD_PATH

if [ -f "$DIR/Dockerfile-previous" ]; then
    rm $BUILD_PATH/Dockerfile
    mv $DIR/Dockerfile-previous $BUILD_PATH/Dockerfile
fi