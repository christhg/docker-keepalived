#!/bin/sh
NGINX=/usr/common/nginx/sbin/nginx
PORT=80
nmap localhost -p $PORT | grep "$PORT/tcp open"
#echo $?
if [ $? -ne 0 ];then
$NGINX -s stop
#这里再次尝试启动NG
$NGINX
sleep 5
nmap localhost -p $PORT | grep "$PORT/tcp open"
[ $? -ne 0 ] && cd /usr/common/keepalived/sbin && pkill keepalived
echo "stoped"
fi
