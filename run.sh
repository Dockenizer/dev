#!/bin/bash

supervisord 2> /dev/null

sudo -E -H -u www-data bash -c /bin/bash