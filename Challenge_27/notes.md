### Level 26 -> Level 27


**Goal**<br>
---
As bandit26 if you have a working shell finding password to the next level wont be difficult

---
**Learnings**<br>
---
- `ls -al` to see what we have
- one suspicious binary SUID file ligering - _bandit27-do_
- It says, I can pretend to be a _bandit27_ and do stuff
- hit this binary followed by the universal password snatching command - `bandit27-do cat /etc/bandit_pass/bandit27`
- DOne!

---
**Outcome**<br>
---
Goal Reached! <!-- Password to next level:: `upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB` -->