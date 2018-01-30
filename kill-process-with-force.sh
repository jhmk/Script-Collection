sudo ps -ef | grep *PROCESSNAME* | grep -v grep | awk '{print $2}' | xargs sudo kill -SIGSTOP
sudo ps -ef | grep *PROCESSNAME* | grep -v grep | awk '{print $2}' | xargs sudo kill -9
