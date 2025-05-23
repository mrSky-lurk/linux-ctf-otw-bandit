### Level 9 -> Level 10


**Goal**<br>
Connect to bandit9 and find out the password which is located in **data.txt**
A. the _password_ is one of the few strings which is human-readable
B. the _password_ is preceded by few '=' signs

**Learnings**<br>
- only few lines are human-readable, rest every thing is binary dump
- We have a key i.e. '==' and can `grep` to pop out the password
- But It only shows if the key is found or not, its not showing the value because the content is having garbage binary dump
    - O/P: `grep: data.txt: binary file matches`
- `strings` gives the human-readable output of any file, unlike `cat`
- We need to use `strings` to make contents of **data.txt** human readable - Then we need to `grep` the password using the [Key]
    


**Outcome**<br>
Goal Reached! <!-- Password to next level:: `FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey` -->