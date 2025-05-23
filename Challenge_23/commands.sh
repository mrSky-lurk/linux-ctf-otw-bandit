# check md5sum for the text
echo I am user bandit23 | md5sum
OP::
8ca319486bfbbc3663ea0fbe81326349 - 

# cut repect to SPACE and take 1st sub string
echo 8ca319486bfbbc3663ea0fbe81326349 - | cut -d ' ' -f 1
OP::
8ca319486bfbbc3663ea0fbe81326349

#Get into the target to get the pwd
 cat /tmp/8ca319486bfbbc3663ea0fbe81326349