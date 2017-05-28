#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MYSQL_INIT_SQL=$1

mkdir -p ~/tvster/mysql-data

if [ -n $MYSQL_INIT_SQL ] && [ $MYSQL_INIT_SQL = true ]; then
    echo "Creating folder for volume mount of SQL scripts..."
    mkdir -p ~/tvster/mysql/startup
    cp $DIR/app/mysql/startup/*.sql ~/tvster/mysql/startup
fi
