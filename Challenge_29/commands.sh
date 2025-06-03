# Clone a git repo overriding the default port
GIT_SSH_COMMAND='ssh -p 2220' git clone ssh://bandit28-git@localhost/home/bandit28-git/repo

# Check out the Commit logs
git log -p README.md
