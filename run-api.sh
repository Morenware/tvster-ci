#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export API_VERSION=$1
PREPARE_MYSQL=$2
API_AWS_CREDS=$3

# We export here so these vars can be read from docker-compose.yml environment variables
export USERNAME=$4
export PASSWORD=$5

APP=tvster-api
PORT=4000

if [ -z "$API_VERSION" ]; then
  export API_VERSION=$(cat $DIR/app/tvster-api/BUILD)
fi

if [ -n $PREPARE_MYSQL ] && [ $PREPARE_MYSQL = true ]; then
  echo "Preparing MySQL volumes..."
  $DIR/prepare-mysql.sh true
fi

echo "Running version $API_VERSION"
cp ${DIR}/app/tvster-api/image/docker-compose.yml .

echo "AWS Credentials path $API_AWS_CREDS"
# Sourcing here AWS credentials (that need to exported as ENVVARS in whichever script is invoked here)
# , these vars are injected into ENV of container
. $API_AWS_CREDS

# Kill current
docker-compose down

# Start new one
docker-compose up

rm $DIR/docker-compose.yml


