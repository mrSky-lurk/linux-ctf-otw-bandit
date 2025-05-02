# check all files under the folder including hidden files
ls -al

# Check the types of the files whose name contains 'file' keyword, as all files have this keyword in common
file ./*file*

# sample output
./-file00: PGP Secret Sub-key -  # Possible suspect
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text  #  Possible suspect
./-file08: data
./-file09: data

# check the contents of  Possible suspects
cat ./-file07