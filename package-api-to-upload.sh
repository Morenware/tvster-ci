#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=tvster-api

# SSH user and server (must have passwordless sudo)
USER=tvster
SERVER=tvster01

# Prepare package
mkdir -p ./$APP
cp $DIR/creds/awsCreds.sh ./$APP
cp $DIR/app/$APP/image/docker-compose.yml ./$APP
cp $DIR/run-api.sh ./$APP

tar czf $APP.tar.gz ./$APP
scp $APP.tar.gz $USER@$SERVER:/tmp
rm $APP.tar.gz