#!/bin/bash
if [ "${uid}" != "" ]
then
    usermod -u $uid www-data
fi

sudo -H -u www-data bash -c /bin/bash