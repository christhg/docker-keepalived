#!/bin/bash

#在實體机上設定cron,每2秒檢測一次

#判斷docker-nginx的nginx.pid是否存在,用來監看nginx服務是否啟動
#因為實體机可能會啟動多個nginx服務,為了檢測是哪個nginx容器,因此
#nginx容器必須掛載-v ./run/nginx.pid:/run/nginx.pid
#獲取nginx.pid用以分別不同的nginx服務

file="/root/docker-nginx/run/nginx.pid"
if [ -f "$file" ];then
      #echo "nginx is running..."  #表示nginx服務啟動中
   else
      echo "killall keepalived..."  #表示nginx服務失敗...stop or kill keepalived容器
      docker stop keepalived  # docker rm -f keepalived
fi

