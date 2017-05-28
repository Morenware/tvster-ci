#!/bin/bash

# tvster-api, mysql, tvster-organizer, tvster-organizer-base-rpi, tvster-organizer-base-x86
# APP=$1

# Docker username and password, dfernandez/XXXX
USERNAME=$1
PASSWORD=$2

docker login --username=$USERNAME --password=$PASSWORD

