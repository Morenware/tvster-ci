#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Share data with host to keep persistence
# Share specific initdb folder to import startup scripts
ROOT_PASSWORD=$1
IMAGE_TAG=$2 || 5.6

# MYSQL port exposed to the outside world
EXPOSED_PORT=$3 || 3308
mkdir -p /tmp/mysql-startup
cp $DIR/startup/tvster-init.sql /tmp/mysql-startup
mkdir -p /home/tvster/mysql-data
docker run --name tvster-mysql -v /opt/tvster/mysql-data:/var/lib/mysql -v /tmp/mysql-startup:/docker-entrypoint-initdb.d \
-e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD -p $EXPOSED_PORT:3306 -d mysql/mysql-server:${IMAGE_TAG} --character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci