#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OPENSUBTITLES_USERNAME=davidfm
OPENSUBTITLES_PASSWORD=$1

echo "$OPENSUBTITLES_USERNAME" >> $DIR/osdb.txt
echo "$OPENSUBTITLES_PASSWORD" >> $DIR/osdb.txt

docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker build -t tvster/tvster-rpi-base:v1.0.1 .
rm $DIR/osdb.txt