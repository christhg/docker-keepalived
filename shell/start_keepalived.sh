#!/bin/bash 
docker run --rm --name keepalived \
  --cap-add=NET_ADMIN --net=host \
  -e KEEPALIVED_UNICAST_PEERS=192.168.201.61 \
  -e KEEPALIVED_VIRTUAL_IPS=192.168.201.60 \
  -e KEEPALIVED_PRIORITY=200 \
  osixia/keepalived:latest
