#!/bin/bash

#在實體机上設定cron,每5秒檢測一次

#判斷docker-nginx的nginx.pid是否存在,用來監看nginx服務是否啟動
#因為實體机可能會啟動多個nginx服務,為了檢測是哪個nginx容器,因此
#nginx容器必須掛載-v ./run/nginx.pid:/run/nginx.pid
#獲取nginx.pid用以分別不同的nginx服務
#----------------------------------------------------------------------------------

nginx_pid="/root/docker-nginx/run/nginx.pid" # 監看的nginx服務的pid
keepalived_pid="/root/docker-keepalived/run/keepalived.pid" # 自身keepalived服務pid
step=5 #间隔的秒数，不能大于60  

if [ -f "$keepalived_pid" ];then
   for (( i = 0; i < 60; i=(i+step) ));do  
     if [ ! -f "$nginx_pid" ];then
         #echo "killall keepalived..."  #表示nginx服務失敗...stop or kill keepalived容器
         docker stop keepalived         # docker rm -f keepalived
     else
        echo "ngix is running..."
     fi
     sleep $step  
   done  
fi

echo "keepalived is dead..."
exit 0 
