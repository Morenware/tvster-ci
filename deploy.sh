#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1
USER=$2
SERVER=$3

$DIR/package-and-upload.sh $APP $USER $SERVER

ssh $USER@$SERVER "mkdir -p ~/app/" 2>&1
ssh $USER@$SERVER "rm -rf ~/app/$APP-previous && mv ~/app/$APP ~/app/$APP-previous" 2>&1
ssh $USER@$SERVER "cd ~/app && tar -xvzf /tmp/$APP.tar.gz" 2>&1
ssh $USER@$SERVER "cd ~/app/$APP && chmod +x *.sh && ./run.sh" 2>&1
ssh $USER@$SERVER "docker logs $APP" 2>&1