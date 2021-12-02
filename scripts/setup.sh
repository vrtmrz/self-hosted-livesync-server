#!/bin/sh
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'This operation requires root priviledge.'
    exit
fi
docker network create caddy
adduser --no-create-home --uid 5984 --shell /sbin/nologin --disabled-password couchdb