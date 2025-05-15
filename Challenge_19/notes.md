### Level 18 -> Level 19


**Goal**<br>
---
Connect to bandit18 and find out the password
- that is stored in _readme_ file but I can not log in
- The password for _bandit18_ is correct but there is a twig in ***.bashsrc*** which is kicking me out

---
**Learnings**<br>
---
- I can log in as _bandit17_ and can see the existance of ***'home/bandit18/readme'*** BUT I dont have access to read it
    + Hence can not `cp` it out
- I dont have `sudo` access. Duh!
- As a _bandit17_ I can not `su bandit18`
    * Its asking for password, And I do have the correct password, but its throwning - `Authentication Failure` 
- if i can `ssh` into _bandit18_ by somehow bypassing the _.bashsrc_ file, i can get hold of the _readme_ -- It lookslike I CAN do that
    * ✅ by directly giving the subsequent commands along with the `ssh` - `... 'cat ~/readme'`
    * ✅ by launching a new fresh terminal `-t` with default _.bashrc_ no tricks! - `/bin/sh`
    * ✅ by launching a terminal `-t` ignoring ~/.bash_profile, ~/.bashrc, ~/.bash_login, or /etc/bash.bashrc `... "bash --noprofile --norc"`

---
**Outcome**<br>
---
Password to next level:: `cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8`