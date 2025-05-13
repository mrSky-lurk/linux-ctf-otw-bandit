# Simply try to log in to localhost
ssh bandit14@local host
OP::
!!! You are trying to log into this SSH server with a password on port 2220 from localhost.
!!! Connecting from localhost is blocked to conserve resources.
!!! Please log out and log in again.

# Ignore adding the known host
ssh -i sshkey.private -o UserKnownHostsFile=/dev/null bandit14@localhost

OP: "The authenticity of host 'localhost (127.0.0.1)' can't be established.
ED25519 key fingerprint is SHA256:C2ihUBV7ihnV1wUXRb4RrEcLfXC5CXlhmAAM/urerLY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'localhost' (ED25519) to the list of known hosts.

                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

!!! **You are trying to log into this SSH server on port 22, which is not intended.**

bandit14@localhost: Permission denied (publickey)."


ssh sshkey.private bandit14@localhost -p 2220
OP:: Welcome sir _bandit14_!!

# Locate the Key
cat /etc/bandit_pass/bandit14