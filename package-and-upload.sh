#!/bin/bash

APP=$1
LOCATION=$2

if [ -z "$LOCATION" ]; then
 LOCATION=./app/$APP
fi

tar czf $APP.tar.gz $LOCATION
scp $APP.tar.gz tvster@tvster01:~/
rm $APP.tar.gz