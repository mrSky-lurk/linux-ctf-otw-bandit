### Level 23 -> Level 24


**Goal**<br>
---
Connect to bandit23 and analyse the cronjob cofiguration at /etc/cron.d
- Write a script so that the cronjob which runs at each interval can execute and pull out the password for next level

---
**Learnings**<br>
---
- Locate the __*cronjob_bandit24.sh*__ at '/usr/bin/cronjob_bandit24.sh'
```sh
#!/bin/bash
myname=$(whoami) # bandit24 -> as the cronjob runs as bandit24
cd /var/spool/$myname/foo # gets into this location 
echo "Executing and deleting all scripts in /var/spool/$myname/foo:" # Some echo
for i in * .*; # FOr loop for all files under foo, (*) - All and (.*) - hidden 
do
    if [ "$i" != "." -a "$i" != ".." ]; # Do not touch/go to (.) - current folder and (..) Parent folder
    then
        echo "Handling $i" # Some echo
        owner="$(stat --format "%U" ./$i)" # stat --format "%U" returns the Owner of the file. For my script file it will be 'bandit23' ✅
        if [ "${owner}" = "bandit23" ]; then # if the owner is bandit23
            timeout -s 9 60 ./$i # ./myscript.sh =  Runs and effective for 60 sec timeout, -s 9 = Force quit
        fi
        rm -f ./$i # Remove the current file and move to next file
    fi
done
```
- As a _bandit23_ i have to write a script and keep it under - '/var/spool/bandit24/foo/'
- lets `vim /var/spool/bandit24/foo/myinjection.sh` - [my script](script.sh) - `:wq` (Remember this file has a lifespan of 60 sec then its gone)
- lets set the permission for this file so that Owner = r+W+x; group=r+x; other=r+x - `chmod 755 /var/spool/bandit24/foo/myinjection.sh` 
- I need a text file which `echo` the logs > i can keep it in tmp folder
    + `mktemp -d`
    + `touch /tmp/tmp.zeez1QFcoV/mylog.log`
    + `chmod 766 /tmp/tmp.zeez1QFcoV/mylog.log` - to give proper permission to read and write for group and other user
- `cat /tmp/tmp.zeez1QFcoV/mylog.log` to check the logs and the password


---
**Outcome**<br>
---
Goal Reached! <!-- Password to next level:: `gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8` -->
<!-- hide-this -->

