# Check IPs -  #en5 : ethernet | lo : localhost
ifconfig
OP:: "ens5: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 9001
  inet 10.0.1.228  netmask 255.255.255.0  broadcast 10.0.1.255

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
  inet 127.0.0.1  netmask 255.0.0.0
"

# check file type
file suconnect
OP::
suconnect: setuid ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=a95f034b2749e585fbeed4f260f85a4b150934c2, for GNU/Linux 3.2.0, not stripped

# Run suconnect 
./suconnect
OP::
Usage: ./suconnect <portnumber>
This program will connect to the given port on localhost using TCP. If it receives the correct password from the other side, the next password is transmitted back.

# Lets check open TCP ports
ss -tnlp | grep 127.0.0.1
OP::
LISTEN 0      5          127.0.0.1:60917      0.0.0.0:*
LISTEN 0      5          127.0.0.1:1840       0.0.0.0:*
LISTEN 0      5          127.0.0.1:4321       0.0.0.0:*


# Launch new Terminals session -  Server
tmux new -s banditServer
# Vertica split and launch second Terminal  -Client
[Ctrl+b] + %

# Launch server on 60917 on T1
nc -lp 60917
OP:: `nc: Address already in use`

# T1
nc -lp 1840
> (started...)

# T2 - [Ctrl+b] + Arrowkeys ⬅️➡️
./suconnect 1840

# T1
> IP:: /etc/bandit_pass/bandit20

# T2
OP:: Password matches, sending next password

# T1
OP:: <password of next level>





