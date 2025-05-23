### Level 17 -> Level 18


**Goal**<br>
---
Connect to bandit17 and find out the password 
- which is the only different text in _passwords.new_ and _passwords.old_ files 

---
**Learnings**<br>
---
- I need to use `diff` here - `diff <flag> newtext oldtext`
    * `-i` - ignore case
    * `-y` - Compare side by side - One markar can be seen for the different lines
    * `--suppress-common-lines` - Only shows the distinct lines
    * `-r` - For directories. finding diff recursively

---
**Outcome**<br>
---
Goal Reached! <!-- Password to next level:: `x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO` -->