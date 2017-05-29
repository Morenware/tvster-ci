#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export API_VERSION=v1.0.0-RC1
API_AWS_CREDS_SCRIPT=$1

# We export here so these vars can be read from docker-compose.yml environment variables
export USERNAME=$2
export PASSWORD=$3

COPY_DOCKER_COMPOSE_YML=false
DOCKER_COMPOSE_YML_PATH=$DIR/app/tvster-api/image/docker-compose.yml

APP=tvster-api
PORT=4000

echo "Running version $API_VERSION"
if [ $COPY_DOCKER_COMPOSE_YML = true ]; then
    cp $DOCKER_COMPOSE_YML_PATH .
fi

echo "Sourcing AWS Credentials path $API_AWS_CREDS_SCRIPT"

# Sourcing here AWS credentials (that need to exported as ENVVARS in whichever script is invoked here)
# , these vars are injected into ENV of container
. $API_AWS_CREDS_SCRIPT

# Kill current
docker-compose down

# Start new one
docker-compose up


