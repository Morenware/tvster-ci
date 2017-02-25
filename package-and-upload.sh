#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1
SERVER=$2
LOCATION=$3
REMOTE_PATH=/home/tvster/app

if [ -z "$LOCATION" ]; then
 LOCATION=$DIR/app
fi

echo $LOCATION
cd $LOCATION
tar czf $APP.tar.gz $APP
scp $APP.tar.gz tvster@$SERVER:/tmp
rm $APP.tar.gz