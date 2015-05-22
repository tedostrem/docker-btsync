#! /bin/sh

set -e

[ ! -L /.sync ] && ln -sf /data /.sync

[ ! -f /data/btsync.conf ] && cat > /data/btsync.conf <<EOF
{
  "listening_port": 3369,
  "check_for_updates": false,
  "use_upnp": false,
  "webui": {
    "listen": "0.0.0.0:8888",
    "login": "$BTSYNC_USER",
    "password": "$BTSYNC_PASS"
  }
}
EOF

/btsync --nodaemon --config /data/btsync.conf
