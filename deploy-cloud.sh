#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=$1
SERVER=tvster01

$DIR/package-and-upload.sh $APP $SERVER

ssh tvster@$SERVER "rm -rf ~/app/$APP-previous && mv ~/app/$APP ~/app/$APP-previous" 2>&1
ssh tvster@$SERVER "cd ~/app && tar -xvzf /tmp/$APP.tar.gz" 2>&1
ssh tvster@$SERVER "cd ~/app/$APP && chmod +x *.sh && ./run.sh" 2>&1
ssh tvster@$SERVER "docker logs $APP" 2>&1