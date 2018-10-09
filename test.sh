#!/bin/bash

source "$(pwd)/spinner.sh"

# test success
start_spinner 'sleeping for 2 secs...'
# keep track of spinner in case user does ctrl-c
spinnerid=$!
trap "kill -9 $spinnerid" `seq 0 15`

sleep 2
stop_spinner $?

# test fail
start_spinner 'copying non-existen files...'
# keep track of spinner in case user does ctrl-c
spinnerid=$!
# kill spinner if signal
trap "kill -9 $spinnerid" `seq 0 15`

# use sleep to give spinner time to fork and run
# because cp fails instantly
sleep 1
cp 'file1' 'file2' > /dev/null 2>&1
stop_spinner $?

