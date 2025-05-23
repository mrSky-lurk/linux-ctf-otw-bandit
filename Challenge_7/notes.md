### Level 6 -> Level 7


**Goal**<br>
Connect to bandit6 and find out the password.<br>
But the catch is - 
 - Target File is somewhere in the server
 - The user of the file is **_bandit7_**
 - The file is owned by the group **_bandit6_**
 - The Size is 33 bytes



**Learnings**<br>
- First stuck at file is somewhere in the server
- `find /` searches in the all files and folders recursively - That solves the 1st hurle. But got a dump of numerous number of files like _kumbh ka mela_ of files and some are angry with a _<span style="color:red">Permisson Denied</span>_ look on the face
- `-type f -user bandit7 -size 33c` does filter the files but still lost in great number of _<span style="color:red">Permisson Denied</span>_
- with `exec ls -al {} \;` I did see one file sneak peeking from the big dump with matching details and I can see all the details, like its accessable name _bandit7.password_ I become confident that might be it (it is actually)
- But I want to see that file in braod day light - fair and square
- I investigated and came to know some gibberish `2>/dev/null` needs to be used along with the `find` to ignore the files with _<span style="color:red">Permisson Denied</span>_
    #### 2>/dev/null
    - `2>` is like _stderr_ In shell terms
        1. stdout (normal output)
        2. stderr (error messages)
    - `/dev/null` is like _Black hole_ for linux. If we send some files there, its like _phoof!_✨ gone! No logs, Nothing!
- This one sorted my problem and fetched me the file with matching details
- But I know i ll not be able to remeber `2>/dev/null`, hence I searching for other option
- I came accross `grep` 🍇
    - `-v "Some TEXT"` returns all results ignoring the matching text


**Outcome**<br>
Goal Reached! <!-- Password to next level:: `morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj` -->