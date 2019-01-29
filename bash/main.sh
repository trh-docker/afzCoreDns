#!/bin/sh
cd /opt/dns
ads init
afzas adduser --username $COCKROACH_USER

adfree init
adfree adlist
coredns