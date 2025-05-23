### Level 4 -> Level 5


**Goal**<br>
Connect to bandit4 and find out the password stored in a only human readable file

**Learnings**<br>
- There are list of 8-10 files, and `cat` was not helping
- `cat` spitting out the contents of each file i.e random binary data, One ogicesf the file evidently contains the paswword which is human-readable
- `cat -v <filename>` gives printable contents - > ~~printable means human readable~~
- `cat -A <filename>` gives all secret character contents - > ~~secret character means human readable~~
- `file` command is used to list all files according to their physical types and content types
- found the oddman Out and voila!

**Outcome**<br>
Goal Reached! <!-- Password to next level:: `4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw` -->