
# Check whap packets we have
ls -al .git/objects/pack/
OP::
total 20
drwxrwxr-x 2 bandit30 bandit30 4096 Jun  4 00:46 .
drwxrwxr-x 4 bandit30 bandit30 4096 Jun  4 00:46 ..
-r--r--r-- 1 bandit30 bandit30 1184 Jun  4 00:46 pack-462e0fcc33ab8d8579285116d3c1a2de3f082a7f.idx
-r--r--r-- 1 bandit30 bandit30  298 Jun  4 03:16 pack-462e0fcc33ab8d8579285116d3c1a2de3f082a7f.pack
-r--r--r-- 1 bandit30 bandit30   68 Jun  4 00:46 pack-462e0fcc33ab8d8579285116d3c1a2de3f082a7f.rev

# check the pack file
git verify-pack -v .git/objects/pack/pack-462e0fcc33ab8d8579285116d3c1a2de3f082a7f.pack
OP::
fb05775f973256dc6d8d5bb6a8e6b96b0d8795c8 commit 194 137 12
84368f3a7ee06ac993ed579e34b8bd144afad351 blob   33 43 149
bd85592e905590f084b8df33363a46f9ac4aa708 tree   37 48 192
029ba421ef4c34205d52133f8da3d69bc1853777 blob   30 38 240
non delta: 4 objects
.git/objects/pack/pack-462e0fcc33ab8d8579285116d3c1a2de3f082a7f.pack: ok

# Take a peek at a blob
git cat-file -p 84368f3a7ee06ac993ed579e34b8bd144afad351
OP::
fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy

# Take a peek at a commit
git cat-file -p fb05775f973256dc6d8d5bb6a8e6b96b0d8795c8
OP::
tree bd85592e905590f084b8df33363a46f9ac4aa708
author Ben Dover <noone@overthewire.org> 1744295004 +0000
committer Ben Dover <noone@overthewire.org> 1744295004 +0000

initial commit of README.md

# Take a peek at another blob
git cat-file -p 029ba421ef4c34205d52133f8da3d69bc1853777
OP::
just an epmty file... muahaha
