# Check the Script, Runs at regular interval as Bandit 24

cat /usr/bin/cronjob_bandit24.sh

# the cronjob

#!/bin/bash
myname=$(whoami)

cd /var/spool/$myname/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done


# Lets create a tmp folder and log file to track the 'echo's of my script > ref: Challenge_24\script.sh
mktemp -d
touch /tmp/tmp.zeez1QFcoV/mylog.log
chmod 766 /tmp/tmp.zeez1QFcoV/mylog.log # to give proper permission to read and write for group and other user



# Write a script and keep it under /var/spool/bandit24/foo/
vim /var/spool/bandit24/foo/myinjection.sh

# Once done, Change permission so Other USer or group can (read+execute)
chmod 755 /var/spool/bandit24/foo/myinjection.sh


cat /var/spool/bandit24/foo/myinjection.sh
> Challenge_24\script.sh
