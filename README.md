# docker-keepalived
使用keepalived監測nginx單點故障達到ha高可用

## clone
#git clone docker-keepalived to /root  
#git clone docker-nginx to /root

## start nginx
#cd /root/docker-nginx  
#docker-compose up -d

## start keepalived
#cd /root/docker-keepalived    
#docker-compose up -d

## cron to check nginx on real machine
#vi /etc/crontab  
\* * * * * root /root/docker-keepalived/check_nginx_service.sh 2>/dev/null 1>&

## check_nginx_service.sh description
+ this shell is to check nginx pid,if not exist then kill docker-keepalived
