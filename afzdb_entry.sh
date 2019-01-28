#!/usr/bin/env bash

export NATS_ADDRESS=tls://blc.adfreezone.org
export NATS_PORT=8443
export COCKROACH_ADDRESS=blc.adfreezone.org
export COCKROACH_PORT=26257
export COCKROACH_DATABASE=afz
export COCKROACH_USER=afzuser 
export ONEPASS=ErCkixHovgac7nFAm3ze 
export LISTEN_ON=0.0.0.0 
export LISTEN_PORT=80
export NATSD_HOST=blc.adfreezone.org
export FE4Hs7uAehidCqpn93az=qE9FpxyA3hsudjH4fica


afzas init
afzas adduser --username $COCKROACH_USER
afzas database -cl