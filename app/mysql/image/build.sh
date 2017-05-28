#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export MYSQL_IMAGE=dfernandez/tvster:mysql-5.6
docker rmi $MYSQL_IMAGE -f
docker build -t $MYSQL_IMAGE $DIR
