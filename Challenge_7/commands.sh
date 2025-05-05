# To find files with the matching criteria and list all along with Hidd files
find / -type f -size 33c -user bandit7 2>dev/null -exec ls -al {} \;

# Alternate approach
find / -type f -size 33c -user bandit7 2>&1 | grep -v "Permission denied"
