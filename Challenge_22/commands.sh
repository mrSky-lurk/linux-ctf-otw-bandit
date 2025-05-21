# check whats there into /etc/cron.d/
cd /etc/cron.d/
ls -al
OP::
total 48
drwxr-xr-x   2 root root  4096 Apr 10 14:24 .
drwxr-xr-x 121 root root 12288 Apr 21 12:42 ..
-rw-r--r--   1 root root   123 Apr 10 14:16 clean_tmp
-rw-r--r--   1 root root   120 Apr 10 14:23 cronjob_bandit22
-rw-r--r--   1 root root   122 Apr 10 14:23 cronjob_bandit23
-rw-r--r--   1 root root   120 Apr 10 14:23 cronjob_bandit24
-rw-r--r--   1 root root   201 Apr  8  2024 e2scrub_all
-rwx------   1 root root    52 Apr 10 14:24 otw-tmp-dir
-rw-r--r--   1 root root   102 Mar 31  2024 .placeholder
-rw-r--r--   1 root root   396 Jan  9  2024 sysstat

# Whats cronjob_bandit22
cat cronjob_bandit22
OP::
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null

# Take a peek
cat /usr/bin/cronjob_bandit22.sh
OP::
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv


# Lets utilize CHMOD 644
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
OP:: <password>
