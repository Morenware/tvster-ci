#!/bin/bash

USER=tvster
SERVER=tvster01

mkdir -p ./mysql-init
cp ./app/mysql/startup/*.sql ./mysql-init
tar czf mysql-init.tar.gz ./mysql-init
scp mysql-init.tar.gz $USER@$SERVER:/tmp
rm mysql-init.tar.gz

ssh $USER@$SERVER "rm -rf ~/mysql-init && rm -rf ~/tvster/mysql-data" 2>&1
ssh $USER@$SERVER "mkdir -p ~/mysql-init && mkdir -p ~/tvster/mysql-data && cd ~/mysql-init && tar -xvzf /tmp/mysql-init.tar.gz" 2>&1
ssh $USER@$SERVER "cd ~/mysql-init/mysql-init" 2>&1
ssh $USER@$SERVER "docker run --name tvster-mysql -v ~/tvster/mysql-data:/var/lib/mysql -v ~/mysql-init/mysql-init:/docker-entrypoint-initdb.d \
-e MYSQL_ROOT_HOST=% -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3306:3306 -d dfernandez/tvster:mysql-5.6 --character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci" 2>&1
rm -rf ./mysql-init