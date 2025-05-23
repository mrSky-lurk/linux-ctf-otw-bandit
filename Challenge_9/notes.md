### Level 8 -> Level 9


**Goal**<br>
Connect to bandit8 and find out the password that is stored in **data.txt** and the password is the only entry that has not duplicates (unique)

**Learnings**<br>
- `uniq` is the way to go here
    - `-c` shows the counts of occurances of each line
    - `-u` shows only unique lines
    - `-d` shows only duplicate lines  
- Limitation of `uniq` is it only works when the duplicate lines ate adjacent lines i.e line next to it is same
- We need to sort the lines using `sort` and then its easy-peasy!
    - By default it sorts in alphabetical order
    - `-r` to reverse the order
    - `-n` to sort by numerical values
- we used Pipe `|` operator here to merge the commands

**Outcome**<br>
Goal Reached! <!-- Password to next level:: `4CKMh1JI91bUIZZPXDqGanal4xvAg0JM` -->