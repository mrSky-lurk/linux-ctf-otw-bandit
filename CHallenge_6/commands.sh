#  As per the given criteria mentioned in the **Goal** 
#     1. Human-Readable `ls -v`
#     2. Size 1033 Bytes `-size 1033c`
#     3. Not Executable `! -perm /111`

find . -type f -size 1033c ! -perm /111
# O/P 
./maybehere07/.file2



# To list all the file to cross check it found out correct file we have to ls -l on the found element
find . -type f -size 1033c ! -perm /111 -exec ls -al {} \;
# O/P
-rw-r----- 1 root bandit5 1033 Apr 10 14:23 ./maybehere07/.file2

# To check the content (The password) of the file 
cat ./maybehere07/.file2

# We can add cat along with find command to see the contents of the desired file
find . -type f -size 1033c ! -perm /111 -exec cat {} \;

