#!/bin/bash
cd `dirname $0`
cd ..
yaml="-f docker-compose.yml"
arch=$(uname -i)
if [[ "$arch" =~ ^aarch ]];
then
    yaml="-f docker-compose.yml -f docker-compose.arm.yml"
fi
if [[ "$arch" =~ ^arm ]];
then
    yaml="-f docker-compose.yml -f docker-compose.arm.yml"
fi

docker-compose $yaml up