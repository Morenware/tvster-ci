#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

APP=tvster-api
USER=tvster
SERVER=tvster01

$DIR/package-api-to-upload.sh

ssh $USER@$SERVER "mkdir -p ~/app/" 2>&1
ssh $USER@$SERVER "rm -rf ~/app/$APP-previous && mv ~/app/$APP ~/app/$APP-previous" 2>&1
ssh $USER@$SERVER "cd ~/app && tar -xvzf /tmp/$APP.tar.gz" 2>&1
ssh $USER@$SERVER "cd ~/app/$APP && chmod +x *.sh && ./run-api.sh ./awsCreds.sh admin password" 2>&1
ssh $USER@$SERVER "docker-compose logs -f" 2>&1