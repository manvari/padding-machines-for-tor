#!/bin/bash

# the number of docker instances to create
WORKERS=20

# the absolute path to the experiment folder where you put collect.py and TB
FOLDER=/home/user/collect/exp/

# the number of seconds to collect data for per instance visit
TIMEOUT=60

# the minimum number of circpad trace events to accept
MIN=100

# the URL of the server
SERVER=http://server:5000

for ((n=0;n<$WORKERS;n++)) do
    docker run -d \
    -v $FOLDER:/home/user/exp wf-collect \
    python3 -u \
    /home/user/exp/collect.py \
    -b /home/user/exp/tor-browser_en-US/ \
    -u $SERVER \
    -m $MIN \
    -t $TIMEOUT
done
