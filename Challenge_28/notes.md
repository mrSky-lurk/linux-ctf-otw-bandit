### Level 27 -> Level 28


**Goal**<br>
---
Connect to bandit27
- Clone a git repo from _ssh://bandit27-git@localhost/home/bandit27-git/repo_ via the port `2220`. The password for the user _bandit27-git_ is the same as for the user _bandit27_.
- Find the password lying around

---
**Learnings**<br>
---
- Create a temp dir to clone the repo - `mktemp -d`
- Cloning a repo from git is pretty simple - `git clone ssh://bandit27-git@localhost/home/bandit27-git/repo` --- ❌ Failed
🤔 Wait! there's the port
- To clone a repo using a overriding the default port looks like this - `GIT_SSH_COMMAND='ssh -p 2220' git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`
    * `GIT_SSH_COMMAND='ssh -p 2220'`   : Temporarily overrides the default SSH command to use port 2220.
    * `git clone ssh://...` : The actual Git command using the SSH URL.
- Once Cloned its so obvious

---
**Outcome**<br>
---
Goal Reached! <!-- Password to next level:: `Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN` -->