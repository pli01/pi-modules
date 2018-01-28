#!/bin/bash
# Client Env Vars
set -e

if [ "$1" = 'docker' ]; then

        echo "******* PROCESSING POST CONFIGURATION *********"
        echo "******* STARTING DOCKER *********"
	# command line to start process
	# if process is launched with a start service don't forget to tail it
else
        exec "$@"
fi

