#!/bin/bash
# Client Env Vars
set -e

if [ "$1" = 'resolv_conf' ]; then

        echo "******* PROCESSING POST CONFIGURATION *********"
        echo "******* STARTING RESOLV_CONF *********"
	# command line to start process
	# if process is launched with a start service don't forget to tail it
else
        exec "$@"
fi

