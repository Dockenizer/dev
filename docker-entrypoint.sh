#!/bin/bash

if [ "${uid}" != ""  ] && [ ${uid} != `id -u www-data` ] ;
then
    usermod -u $uid www-data

    if [ -d "${home}/.ssh" ]; then
        cp -R "${home}/.ssh" /home/www-data/
        chown -R www-data /home/www-data/.ssh
    fi

    if [ -f "${home}/.gitconfig" ]; then
        cp "${home}/.gitconfig" /home/www-data/
    fi

    chown -R www-data /home/www-data
fi

sudo -E -H -u www-data bash -c "$@"