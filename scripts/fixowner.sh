#!/bin/bash
if [ ${EUID:-${UID}} != 0 ]; then
    echo 'This operation requires root priviledge.'
    exit
fi
cd `dirname $0`
cd ..
owner=`ls -ld . | awk -v "OFS=:" '{ print $3,$4 }'`
chown -R $owner conf