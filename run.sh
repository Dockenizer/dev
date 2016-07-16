#!/bin/bash

if [ "${uid}" != ""  ] && [ ${uid} != `id -u www-data` ] ;
then
    usermod -u $uid www-data
fi

sudo -E -H -u www-data bash -c /bin/bash