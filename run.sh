#!/bin/bash

if [ "${uid}" != ""  ] && [ ${uid} != `id -u www-data` ] ;
then
    usermod -u $uid www-data
fi

sudo -H -u www-data bash -c /bin/bash