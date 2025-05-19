### Level 19 -> Level 20


**Goal**<br>
---
Connect to bandit19 and find out the password 
- The only way to see the password for next level _bandit20_ is to see it from '/etc/bandit_pass/bandit20'
- _bandit19_ has a executable binary file _bandit20-do_ which has **SUID** permission

---
**Learnings**<br>
---
#### What is SUID?
- SUID is a permission bit denoted by 's'(and 4), if it is set for any file(a binary or an executable file), the other-user or group can execute that as a USER(or root in somecases) 
- Meaning even if a regular user runs the file, it runs with the privileges of whoever owns the file, usually the superuser (root).

- Example-<br>
    - 
    ```sh
    ls -l /usr/bin/passwd
    -rwsr-xr-x 1 root root 54256 Mar 28 08:42 /usr/bin/passwd
    ↑
    That 's' in place of 'x' = setuid bit is set
    ```
    - here `passwd` is a binary file which is executed to change passwords
    - Check out the permission part - User, Group and OtherUser can execute this file
    - Now focus - the `s` part for User (here root) permission bit, it states that when OtherUser runs this file allow it to act as `SUDO` (here root) and do what `passwd` command does as a root

#### Binary/Executable File
- Syntax: `./<filename> [some aruguments or commands like cat, bash]`
- `./` is to specify the terminal to use current location, otherwise it reads locations from $PATH

#### Back To Game
- 
- this is the permission set for 'bandit20-do'
    + `-rwsr-x---  1 bandit20 bandit19 14884 Apr 10 14:23 bandit20-do`
- As _bandit19_ I have `x` permission
    + So execute it without and argument to understand what this executable file does -`./bandit20-do`
    + It says - `Run a command as another user. \nExample: ./execute-this id` - Meaning I can run a command as anotheruser(or as _bandit20_)
- What I know is - Only a _bandit20_ can access this - `/etc/bandit_pass/bandit20` lets get to it
- `./bandit20-do cat /etc/bandit_pass/bandit20` - And VOILA! ✌️

<br><span style="color:red"><b>What if!</b></span><br>

I Run this `./bandit20 bash` -> And I am In!
- It'd be Fun to gain a whole system posing as a _bandit20_

```sh
bash-5.2$ cat /etc/bandit_pass/bandit20
> cat: bandit20: Permission denied
```
<br>💥Reality Check! -> <b style="color:blue">bash-5.2$ </b><I style="color:yellow">whoami</I> <br>

`OP:: bandit19 ` but why?
- It is owned by _bandit20_
- It has the setuid bit set (s in rws)
- So it should run as _user20_, right?

<br>❌ Wrong<br>
- Modern Linux systems intentionally strip the setuid bit from interpreted shells, like bash, sh, python, etc., for safety reasons.

<br>Why?<br>
Because letting someone run bash as another user (even non-root) is basically giving them the keys to the kingdom. It’s an easy privilege escalation path. Linux ain't falling for that.



---
**Outcome**<br>
---
Password to next level:: `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO`