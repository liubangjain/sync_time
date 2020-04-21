#!/bin/bash
#将该脚本加入crontab定时任务，命令：crontab -e
#日志目录
LOG_NAME=/opt/sync-time/sync-time.log

echo "同步北京时间 start"
before=$(date "+%Y-%m-%d %H:%M:%S")
#获取互联网时间，这里请求的是苏宁提供的API
result=$(curl -s http://quan.suning.com/getSysTime.do)
datetime=${result:13:19}
echo $datetime
#设置时间
date -s "$datetime"
after=$(date "+%Y-%m-%d %H:%M:%S")
echo "同步前系统时间:$before,同步后系统时间:$after" >> $LOG_NAME
echo "同步北京时间 end"
————————————————
版权声明：本文为CSDN博主「JQ棣」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/w13528476101/java/article/details/102575687
