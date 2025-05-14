# Check open ports
nmap -p 31000-32000 localhost
OP:: "Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-05-14 02:20 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00010s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT      STATE SERVICE
31046/tcp open  unknown
31518/tcp open  unknown
31691/tcp open  unknown
31790/tcp open  unknown
31960/tcp open  unknown"
# 5 Open ports

# Find Ports with TLS encryption with openssl/socat/curl
openssl s_client -connect localhost:31518
OR
socat - OPENSSL:localhost:31790,verify=0
## RSA Private key received

# copy the RSA text into a passkey.key file
vim passkey.key >  ctrl+v > ":wq"

# set correct set of permission for passkey.key file
chmod 600 passkey.key 

# ssh into bandit17
ssh -i passkey.key bandit17@localhost -p 2220

# OPTIONAL - get it as plain TEXT as bandit17
cat /etc/bandit_pass/bandit17



