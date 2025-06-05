#Clone Repo
 GIT_SSH_COMMAND='ssh -p 2220' git clone ssh://bandit29-git@localhost/home/bandit29-git/repo

# See all the commits to the repo
git rev-list --all
OP::
3b8b91fc3c48f1a19d05670fd45d3e3f2621fcfa
a97d0dbf8fd910ead6fcf648829ff55c1a629c8e
c2e20a2bcc4815a984fbef4c7a96ca6e4de35c48
8d2ffeb5e45f87d0abb028aa796e3ebb63c5579c
3910630172946c9ffb75842922e394b772c672bd


# Show a particular commit contents
git show a97d0dbf8fd910ead6fcf648829ff55c1a629c8e
OP::"
commit a97d0dbf8fd910ead6fcf648829ff55c1a629c8e (origin/dev)
Author: Morla Porla <morla@overthewire.org>
Date:   Thu Apr 10 14:23:21 2025 +0000

    add data needed for development

diff --git a/README.md b/README.md
index 1af21d3..bc6ad3d 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for bandit30 of bandit.
 ## credentials

 - username: bandit30
-- password: <no passwords in production!>
+- password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
"

# Alternatively
git grep password $(git rev-list --all)
OP::
Refer: ./Challenge_30/image.png