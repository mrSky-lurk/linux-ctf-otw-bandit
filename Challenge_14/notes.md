## Level 13 -> Level 14
Connect to bandit13 and find out the password for next level


**Hints**<br>
---
- The password of the next level is stored in this path - ***/etc/bandit_pass/bandit14*** 
- This Path is **only** readable by a user _bandit14_
- I have a private sshkey which can be used to log in as a _bandit14_
- localhost is a hostname that refers to the machine I am working on

---
**Learnings**<br>
---
- Lets strat from the bottom - _bandit13_ has a _sshkey.private_ file that is a _'RSA Private Security Key'_
- This private key is the private ssh key of _bandit14_
###  ❌ Attempt 1 -> ***ssh bandit14@localhost***
- Well this is quite expected, there is no authentication method involved and No password given
- <span style="color:lime">What I know about authentication?</span><br>
    + There are two ways to authenticate 
        1. Using a *Password* - Just like when I logged in to bandit13@bandit.lab.overthewire
        2. Using a ssh Key-pair - Just like I use for GIT hub to communicate with VS Code/IntelliJ
    + `ssh-keygen` which creates the a key pair -  `id_rsa`(Private key) & `id_rsa.pub`(Public key)

    ```sh
    ssh-keygen             # Generates id_rsa and id_rsa.pub
    ssh-copy-id user@host  # Copies the public key to the server
    ```
    + Now, when user tries to `ssh` to the server with the private key, it maps internally and let the user log in.
- Here the 'public key' is already known to the user _bandit14_. it has to be
- And More over when I `ssh-keygen`, I did not have permission and that is quite expeceted
- <span style="color:lime">What details I gather about <I>'sshkey.private'</I></span><br>
    + with `ls -l` I can see `-rw-r-----    1 bandit14 bandit13   1679 May 10 02:13 sshkey.private`
        * Means _bandit14_ can read-write BUT _bandit13_ have only read access
- I need to find a way to include the **_sshkey.private_** while `ssh`
###  ❌ Attempt 2 -> ***ssh -i sshkey.private bandit14@localhost***
- the flag `-i` is used to specify a private key file (or path to `/home/user/key.private`) 
- It will not get through, if the host not registered already under `.ssh/config`, `ssh-agent`, or the default key list like `id_rsa`, `id_ed25519`, etc.
- The key should be matching the public key in the server's _`authorized_keys`_ file, then the login will succeed.
- This time I was getting `OP:: bandit14@localhost: Permission denied (publickey).`
--- Lets Dig deeper --- 
- when using the ssh key to authenticate, I have to make sure I should have read-write access of the `ssh` key 
    * Here I have only read access as a _bandit13_, Hence I have to `chmod 600 sshkey.private` - 🔒I dont have permission
    <span style="color:lime">🤔 BUT WHY!</span><br>
    * To check what permission I have here in this directory, lets `ls -ld .` -> this `-d` tells its a directory and `.` tells current directory
        - The only permission I have in this `--------x`
    * To have all the access and permission I need, I can create a Temp Directory > `cp` the **_sshkey.private_** > `chmod 600 sshkey.private` here and call it from there - Lets do it!
###  ❌ Attempt 3 -> ***ssh -i /tmp/mrSky_T5HYJ765/sshkey.private bandit14@localhost***   
- Now I had full faith that it'll work but it did not
- In the output I saw this - `Failed to add the host to the list of known hosts (/home/bandit13/.ssh/known_hosts).` This may be the issue
    + Naturally `ssh` is trying to add this host(_bandit14_) to the known hosts list of _bandit13_, so that it wont need to for private ssh key again.
    + But I dont have permission to write anything there - "/home/bandit13/.ssh/known_hosts"
    + I can totally ignore this part whith this flag `-o UserKnownHostsFile=/dev/null` - telling shell "Boss, skip it! there is no known host file only"
###  ❌ Attempt 4 -> ***ssh -i /tmp/mrSky_T5HYJ765/sshkey.private -o UserKnownHostsFile=/dev/null bandit14@localhost***   
- Nope, No luck, I had hit the rock bottom here.

### The Mistake 🤦‍♂️
The Mistake I was doing all along was - No Reading the output properly in the Terminal after each attempt
- I was missing the most important part that is I have `ssh` to the host(_bandit14_) <span style="color:lime">by giving the correct  port</span>
- Not using the `-p 2220` was the brutal mistake I was continuously doing all along
- The reason I thought - as I am on current server as a _bandit13_ I dont need to specify the port explicitely
- Then I realised the terminal was shouting this thing every time - **_`!!! You are trying to log into this SSH server on port 22, which is not intended.`_** - BUT I ignored it every time.

###  ✅ Attempt (n+1) -> ***ssh -i sshkey.private bandit14@localhost -p 2220***
- Voila! The bouncer says 'Welcome Sir!'

### Locating the physical password
- East-peasy `cat /etc/bandit_pass/bandit14`

---
**Outcome**<br>
---
Password to next level:: `MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS`