# Using openssl
> openssl s_client -connect localhost:30001
OP::  loads of SSL Dumps and at the End asking for Input
I/P:: <pwd of the prev level>
OP:: Correct! kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

# Using socat
> socat - OPENSSL:localhost:30001 ❌
OP::  
2025/05/13 03:11:55 socat[1771841] W OpenSSL: Warning: this implementation does not check CRLs
2025/05/13 03:11:55 socat[1771841] E SSL_connect(): error:0A000086:SSL routines::certificate verify failed

> socat - OPENSSL:localhost:30001, verify=0 ✅
I/P:: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
OP:: Correct! kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx



