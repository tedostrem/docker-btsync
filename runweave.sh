#!/bin/bash
source /data/env
docker stop btsync
docker rm btsync
docker build -t="tedostrem/btsync" .
weave run $BTSYNC_WEAVE_IP/24 \
	-d \
	-v /data/btsync:/data \
	-e BTSYNC_USER=$BTSYNC_USER \
	-e BTSYNC_PASS=$BTSYNC_PASS \
	-e VIRTUAL_HOST=$BTSYNC_VIRTUAL_HOST \
	-e VIRTUAL_PORT=8888 \
	--name btsync \
	tedostrem/btsync

