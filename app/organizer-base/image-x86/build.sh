#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OPENSUBTITLES_USERNAME=davidfm
OPENSUBTITLES_PASSWORD=$1

echo "$OPENSUBTITLES_USERNAME" >> $DIR/osdb.txt
echo "$OPENSUBTITLES_PASSWORD" >> $DIR/osdb.txt

docker build -t tvster/tvster-x86-base:v1.0.1 .
rm $DIR/osdb.txt