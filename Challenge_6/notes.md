### Level 5 -> Level 6


**Goal**<br>
Connect to bandit5 and find out the password <br>
File is stored in a file with below criteria
- [x] Human-readable
- [x] Size 1033 bytes
- [x] Not Executable

**Learnings**<br>
- `ls -lv` listed down 10 folders, `ls -lv ./*` shows each folder containing around 7-8 files, altogether 700-800 files to look into
- best way to pin point a file with certain criteria is to use _find_
    **_find command_**
    - `-size 1033c` (c = Bytes) || `-size -2000c` (less than 2000 bytes) || `-size +50M` (greater than 50MB)
    - `-type f` (f=file; d=folder) || `-name "*.txt"` (all .txt files)
    - `-exec` to give a command on the found results followed by `{}` and `\;` as **;** has to be used with an excape character `\`
        - `-exec ls -l {} \;` this `{}` means the command will be executed to the same filepath recursively for each iteration
        - To list down all the findings with `-exec ls -al {} \;`
        - To see the conetent of the finding `-exec cat {} \;`
    -  with file permission `-perm XXX` (find with existing permissions - Readable=4; writable=2; executable=1)

    **_File Permission_**
    - it has mostly 3 bits Owner/User(U) | Group(G) | OtherUser(O)
    - Each has again 3 types of Permissions -  Readable=4; writable=2; executable=1; When multiuple permission then just Add up
        | Perm |     O      |   G       |       O        |
        |------|------------|-----------|----------------|
        | 000  | N          | N         | N              |
        | 020  | N          | Write     | N              |
        | 721  | ALL        | Write     | Exec           |
        | 503  | Read+Exec  | N         | Write+Exec     |
    - We can define permission sybolically as well:: u=rw,g=w,o=rx
    - While fininding files with any specific permission We can add a _dash_ `-` as prefix, to tell **_you can ignore other bits but Atleast it does NOT have_** specified bit
    > `-perm u=x`→ means “match files whose permissions are exactly owner=execute and no other bits.”<br>
    > `-perm -u=x` → means “owner has execute”<br>
    > `! -perm -u=x` → means “owner does not have execute”<br>

    - **One effective Numeric Approach**
        - ❌ `find . -type f ! -perm 111`
        “Give me all regular files except those whose permissions are **exactly** --x--x--x

        - ✅ `find . -type f ! -perm /111`
        “Give me all regular files where none of the execute bits (owner, group, or others) are set.”
        → Perfect for “files that are truly non‑executable by anyone.”


**Outcome**<br>
Password to next level:: `HWasnPhtq9AVKe0dmk45nxy20cvUa6EG`