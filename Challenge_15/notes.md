### Level 14 -> Level 15


**Goal**<br>
---
Connect to bandit14 and find out the password 
- which needs to be retrieved from localhost port 30000
- By using the passwrod of the current level

---
**Learnings**<br>
---
- _Netcat(nc)_ is the way to go here
- `nc` is a command line tool that connects to a remote to a specific port - `nc localhost 30000`
    - It opens TCP/UDP connections
    - Listens to connects like a mini server
    - Transfer files (as it establishes connection of UDP ports)
    - Scan port if open to access
- `nc -vz localhost 30000` - to check port is open or not
    + `-v` print verbose in STDOUT
    + `-z` zero-I/O mode (just checks if port is open)


---
**Outcome**<br>
---
Password to next level:: `8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo`