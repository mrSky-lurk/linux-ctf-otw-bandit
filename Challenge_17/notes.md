### Level 16 -> Level 17


**Goal**<br>
---
Connect to bandit16 and find out the password 
- By submitting the password of the current level to a port on **localhost** in the **range 31000 to 32000**

<p style="font-family: 'Courier New', sans-serif; color:lime">:: HINT ::</p>

- First find out which of these ports have a server listening on them. 
- Then find out which of those speak SSL/TLS and which don’t. 
- There is only 1 server that will give the next **credentials**, the others will simply send back to you whatever you send to it.

---
**Learnings**<br>
---
### 1. Find open ports `nmap -p 31000-32000 localhost`
- `nmap`(Network Mapping) is used for port inspection, network discovery and security checks. Its like a Google Map but for Networks
    - **Basic scan** → `nmap 192.168.1.1`
    - **Scan a range of IPs** → `nmap 192.168.1.1-50`
    - **Discover open ports** → `nmap -p 1-65535 192.168.1.1`
    - **Aggressive scan** → `nmap -A 192.168.1.1`
    - **OS detection** → `nmap -O 192.168.1.1`
    - **Service version detection** → `nmap -sV 192.168.1.1`
    - **Stealth scan (SYN scan)** → `nmap -sS 192.168.1.1`
    - **Ping sweep of subnet** → `nmap -sn 192.168.1.0/24`
    - **Run vulnerability scan script** → `nmap --script vuln 192.168.1.1`

### 2. Check if a port is communicating using TLS, There are several ways `openssl`, `socat`, `nc`, `curl` etc , focus on the outputs
+ `openssl s_client -connect localhost:31059`
    * ❌ "Wrong version number error"  - `4087F0F7FF7F0000:error:0A0000F4:SSL ...`    
    * ✅ `SSL handshake successful`
+ `socat - OPENSSL:localhost:31900,verify=0`
    * ❌ `error:0A000086:SSL routines::certificate verify failed`
    * ✅ No STDOUT, Gets you inside, ENter passcode
+ `nc localhost 31518` - Unreliable as `nc` noes not understand ENcription, expectes plain tetxs
    * ❌ Behaves like 'line:34' or for other cases `HTTP/1.1 200 OK`
    * ✅ May print gibberish `^@^@...random gibberish...` or simply NOTHING!
+ `curl -v https://localhost:31010`
    * ❌ 
        ```sh
        * TLSv1.3 (OUT), TLS handshake, Client hello (1):
        * TLSv1.3 (OUT), TLS alert, unexpected_message (522):
        * OpenSSL/3.0.13: error:0A0000F4:SSL routines::unexpected message
        ```
    * ✅ 
        ```sh
        * TLSv1.3 (OUT), TLS handshake, Client hello (1):
        * TLSv1.3 (IN), TLS handshake, Server hello (2):
        * TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
        * TLSv1.3 (IN), TLS handshake, Certificate (11):
        ```
### 3. Crack It!
- After the gathering the info it turns out 
    1. There are only 5 open ports
    2. out of which 2 speaks TLS
    3. And found the Target - `31790`
- I can see a RSA private key in - Thats must be the "Credentials" mentioned in Hint
<br>

- <h4 style="color:lime"> 🔑 Solution 1</h4>
    - Lets Copy it and save it in a temp directory as a _bandit16_ -> `/tmp/tmp.jH6yLHvxh8`
        1. Used `vim passkey.key` -> `:w` to save `:q` to exit
        2. Set correct set of permission -> `chmod 600 passkey.key `
        3. use this `passkey.key` and `ssh` into _bandit17_ -> `ssh -i passkey.key bandit17@localhost -p 2220`
    
- <h4 style="color:lime"> 🔑 Solution 2</h4>
    - Lets Copy it and save it in my ubuntu home  -> `/playGroud/`
        1. Used `vim passkey.key` -> `:w` to save `:q` to exit
        2. Set correct set of permission -> `chmod 600 passkey.key `
        3. use this `passkey.key` and `ssh` into _bandit17_ -> `ssh -i passkey.key bandit17@bandit.labs.overthewire.org -p 2220`
<br><span style="color:skyblue">
**After successfull login as _bandit17_, `cat /etc/bandit_pass/bandit17` and gather the password in plain TEXT format</p>


---
**Outcome**<br>
---
Goal Reached! <!-- Password to next level:: `EReVavePLFHtFlFsjn3hyzMlvSuSAcRD` -->