#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1

# SSH user and server (must have passwordless sudo)
USER=$2
SERVER=$3

LOCATION=$4

if [ -z "$LOCATION" ]; then
 LOCATION=$DIR/app
fi

echo $LOCATION
cd $LOCATION
tar czf $APP.tar.gz $APP
scp $APP.tar.gz $USER@$SERVER:/tmp
rm $APP.tar.gz