grep -i --color=auto -C 1 "==" data.txt

# O/P:: it shows the boolean details, Not the contents
grep: data.txt: binary file matches


# First make it human readable, Then grep
strings data.txt | grep -i --color=auto -C 1 "=="