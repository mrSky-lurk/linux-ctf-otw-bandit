# ssh as bandit18 and cat 'readme' bypassing the '.bashrc'
ssh bandit18@bandit.labs.overthewire.org -p 2220 'cat ~/readme'

# ssh by launching a brand new terminal
ssh -t bandit18@bandit.labs.overthewire.org -p 2220 /bin/sh

# ssh by launching a terminal ignoring ~/.bash_profile, ~/.bashrc, ~/.bash_login, or /etc/bash.bashrc
ssh -t bandit18@bandit.labs.overthewire.org -p 2220 "bash --noprofile --norc"