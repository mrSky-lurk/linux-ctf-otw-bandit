### Level 10 -> Level 11


**Goal**<br>
Connect to bandit10 and find out the password which is located in **data.txt**
1. the contentes are _base64_ encoded

**Learnings**<br>
- To decript the _base64_ encoded data, we have `base64 -d`
- To encript some text file to _base64_ format and display it in terminal- `base64 sometextfile.txt`
    - Remeber - This will Not overright the contents of sometextfile.txt, it will remain as it is (Plain and simple human-readable text)
    - To override the 'sometextfile.txt' - command:  `base64 sometextfile.txt > sometextfile.txt`

**Outcome**<br>
Password to next level:: `dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr`