#!/bin/sh
## ---------------------------------------------------------------------

## Add Tini. 
## Tini operates as a process subreaper for jupyter. This prevents kernel crashes.

#ARG tini_version=v0.16.1
#ARG tini_remote_url=${bulkload_url}/tini/tini

wget -O /usr/bin/tini ${TINI_REMOTE_URL}
chmod +x /usr/bin/tini

## after completed add this:
# ENTRYPOINT ["/usr/bin/tini", "--"]

## Add supervisor

## run mkdir -p /var/log/supervisor if needed
apt update
apt install -y supervisor
apt clean
