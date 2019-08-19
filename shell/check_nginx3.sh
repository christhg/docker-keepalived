#!/bin/bash

if [ "$(ss -tlnp|grep -e 80|wc -l)" -ne '1' ]||[ "$(ss -tlnp|grep -E 8765|wc -l)" -ne '2' ];
then
    docker rm -f keepalived
    ip addr del 10.0.1.50/8 dev eth0
fi
