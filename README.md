# docker-keepalived
使用keepalived監測nginx單點故障達到ha高可用

## clone
#git clone to /root

## docker-compose
#cd /root/docker-keepalived  
#docker-compose up -d  

## cron to check nginx
#vi /etc/crontab
* * * * * root /root/docker-keepalived/check_nginx_service.sh 2>/dev/null 1>&

## check_nginx_service.sh
+ the shell is to check nginx pid,if not exist then kill docker-keepalived
