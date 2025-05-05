# To find files with the matching criteria and list all along with Hidd files
find / -type f -size 33c -user bandit7 2>dev/null -exec ls -al {} \;

# Alternate approach
#Step1
find / -type f -size 33c -user bandit7 2>&1 | grep -v "Permission denied" # O/P: gives the file Loc i.e. /var/lib/dpkg/info/bandit7.password

# View the contents of the file
#Step2
 cat /var/lib/dpkg/info/bandit7.password
