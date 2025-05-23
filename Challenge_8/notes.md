### Level 7 -> Level 8


**Goal**<br>
Connect to bandit7 and find out the password, which is stored in the _data.txt_ file next to the word **_millionth_**

**Learnings**<br>
- _data.txt_ is a text file with huge contents, Hence literally the word **_millionth_** means something here. Duh!
- `grep` is the man here - grep [key] [fileName]
    - we have the word to search for - **_millionth_** and the file
    - `-i` ignores the case
    - `-A N` ; `-B N`; `-C N` - After/Before/A&B with Number of lines to grep (grab)
    - `--color=auto` just to highlight the [key] in case its present

**Outcome**<br>
Goal Reached! <!-- Password to next level:: `dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc` -->