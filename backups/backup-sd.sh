#!/bin/bash

INPUT=/dev/r$1
TODAY_DATE=$(date +%d%m%y)
OUTPUT_IMAGE=rpi-kodi-$TODAY_DATE.img.gz

diskutil unmountDisk /dev/$1
sudo dd bs=1m if=$INPUT | gzip > ${OUTPUT_IMAGE}
