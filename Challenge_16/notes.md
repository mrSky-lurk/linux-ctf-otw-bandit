### Level 15 -> Level 16


**Goal**<br>
---
Connect to bandit15 and find out the password for next level
- which needs to be retrieved from localhost port 30000 
- By using the passwrod of the current level
- Using SSL/TLS encryption

---
**Learnings**<br>
---
<span style="color:lime">Lets Take a look at <b><I>SSL/TLS</b></I></span><br>
    SSL = Secure Sockets Layer (This is OLD and deprecated)<br>
    TLS - Transport Layer Security (This is current version of SSL and used widely)<br>

- TLS encrypts data, that is sent over a network so that NOBODY can read, NOBODY can tamper, Has some Authentication
- Its same when `https://` is used for Facebook and Google, it tells TLS - "do what you do", all stuff that TLS does - 
    + Exchanging of encrytion methods and verifications of certificates from the server
    + Encription begins and now all communication is secured and encrypted
- Used in HTTPS (websites): That little 🔒 in the browser? That’s TLS.
- FTPS and SMTP over TLS (secure email)
- VPNs, SSH tunneling, and more.
> `https://google.com <-> openssl s_client -connect google.com:443`
- To eavsdrop what is going on, hit - `openssl s_client -connect google.com:443`

### OPENSSL
- Generates public keys, Private keys and Certificates
- Create and verify digital signatures
- Perform SSL/TLS connections like browser does
- Inspect Cert details
- Encrypt/Decrypt files and msgs
- Some Usage: 
    + Test TLS on server -> `openssl s_client -connect google.com:443`
    + Generate self signed cert -> `openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes`
    + Decode a Cert -> `openssl x509 -in cert.pem -text -noout`
    + Encript a file -> `openssl enc -aes-256-cbc -salt -in file.txt -out file.enc`
- `s_client` is the command-line SSL/TLS client, who acts as a personal secret agent and does what it does during a connection is established via `openssl`
    * 🔒 Starts a TLS handshake,
    * 📜 Reads and shows you the certificate,
    * 💬 Opens an interactive encrypted session,
    * 🧪 And helps debug SSL/TLS issues with full visibility.

### SOCAT
- In Last Challenge we used `nc`(_netcat_) which remotely connects to the localhost using the port 30000
- `nc`(_netcat_) doesnt have any move, it establishes plain and blantent TCP/UDP connecting with out any encryption, hence not secure
- `socat`(_SOket CAT) is the cooler version of `nc` which have the features of `nc` as well as some additional moves
    - It connects almost anything to anything: files, TCP, UDP, SSL, PTYs, serial ports, you name it.
    - Create a TCP/UDP server or client
    - Forward ports like a mini proxy
    - Add SSL/TLS to raw connections - This is the Goal of this challenge
- Some Usage:
    + TCP client - `socat - TCP:localhost:3000` (same as `nc`)
    + SSL client - `socat - OPENSSL:localhost:3000,verify=0`
### 🤜🤛 Together: openssl + socat
- Use `openssl` to create certs
- Use `socat` to wrap raw TCP connection in SSL using those SSL certs
* `socat - OPENSSL:localhost:30001, verify=0`
    + `socat - OPENSSL:localhost:30001` - Take my input(Aftre connection is made whatever input i give i.e. the password), encrypt it using TLS, and send it to port 30001
    + `verify=0` — even if whatever is listening there isn’t expecting TLS, trust the connection. Its cool! No need to verify the certs
    + A TLS client by default expecteing the server to present its certificates and validates the certificates. Without the `verify=0`, `socat` will be blocking the connection because `socat` will understand the encrypted inputs/data is nothing but gibberish to the server and eventually blocks the connection
    + For the sake of security its **Not Recommended** to put `verify=0` in production or working in real internet, Thats how cyber attackers get into the system.

---
**Outcome**<br>
---
Password to next level:: `kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx`