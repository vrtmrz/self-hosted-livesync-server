#!/bin/sh

docker network create caddy
sudo adduser --no-create-home --uid 5984 --shell /sbin/nologin --disabled-password couchdb