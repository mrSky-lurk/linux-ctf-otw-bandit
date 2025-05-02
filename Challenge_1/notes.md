### Level 0 -> Level 1

**Goal:** 
log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. 
username : bandit0 
password : bandit0. 
Once logged in, go to the Level 1 page to find out how to beat Level 1.

**Learnings** 
- Started with reading about SSH
- Learned about public-key private-key pair using ```ssh-keygen```
- to check ssh key already exists ```ls -al ~/.ssh```
- Bandit provided the hostname __bandit.labs.overthewire.org__ and a port __2220__ to connect to their remote server/computer
- ```ssh mrSky@bandit.labs.overthewire.org``` creates a whole new user, But I need to connect to provided username only
- If correct port is not used it'll land on some other port where the game is not hosted.
- Created a temp Directory as per the Lvl 0 suggestion - not sure why :P
- Connected successfully

**Outcome**
Password for the next level is - ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If



 