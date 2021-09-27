#!/bin/bash

set -e

config=/app/shiny-server.conf

# create a temp file for the re-written configuration
file=$(mktemp)

# get the current user
export USER=$(whoami)

# replace $USER and $PORT with dynamically assigned values from Heroku
envsubst < $config > $file

# finally run Shiny Server
/usr/bin/shiny-server $file
