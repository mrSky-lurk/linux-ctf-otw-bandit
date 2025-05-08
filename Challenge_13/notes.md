### Level 12 -> Level 13


**Goal**<br>
---
Connect to bandit12 and find out the password
- The _Password_ containing file is compressed and archived multiple times and then stored in **data.txt** as a _hexdump_
- To dig deep, Create a _tmp_ directory > copy the **data.txt** > _rename_ if needed and then perform the required operations

**Learnings**<br>
---
### Creating Temp directory under /tmp with unique name
```sh
mktemp -d "mrSky_XXXXXX" # 6 X's will be replaced by unique chars
O/P:: Permission Denaied
```
- We dont have permission to create temp dir with personalized names
- Either use `mktemp -d` - It ll create a random name temp dir; `-d` is flag for _directory_
- OR make sure to give a unique name to the dir, as OverTheWire people might delete the directory if it is not unique in between your actions
- `maketemp -d mrSky_YU90IO80`

### Copy the **data.txt** to your temp dir and Rename it
- Used `cp`to copy and `mv` to Rename

### What is _hexdump_?
- _hexdump_ is a command-line utility used to display the **raw** contents of a file in hexadecimal (and optionally ASCII) format. Think of it as X-ray vision for your files — it shows you what's really inside, byte by byte.

> `hexdump <fileName>`<br>
>  O/P:: `00000000  48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a `
- Converts a normal file(fileName) into a _hexdump_

> `hexdump -C containsTextHelloWorld`<br>
>  O/P:: `00000000  48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a           |Hello World!.|`
- Converts and pretty-print the ASII equivalent value as well at the end

💡Another efficient & light-weight way to create a hexdump is `xxd myfile`
 - To store the dump to a file - `xxd myfile > dump.txt` 
 > `xxd myfile`<br>
 >  O/P:: `00000000: 4865 6c6c 6f20 576f 726c 640a  Hello World.`

### How to understand what technique (_hexdump -C_ or _xxd_) used for the _hexdump_ in **data.txt** ?

- If the _hexdump_ hexdump is created using `xxd` it looks like this - `00000000: 4865 6c6c 6f20 576f 726c 640a  Hello World.`
    1. the offset `00000000:` contains a colon ':' at the end
    2. the hex bytes `4865 6c6c 6f20...` are grouped in 4 Characters
- If the _hexdump_ hexdump is created using `hexdump -C` it looks like this - `00000000  48 65 6c 6c 6f 20 57 6f 72 6c 64 0a      |Hello World.|` 
    1. The offset ends with no colon.
    2. Each byte is space-separated: 48 65 6c... (no 4-character groups).
    3. There’s a double-space gap in the middle (after 8 bytes).
    4. ASCII is enclosed in vertical bars: |Hello World.|
    

### How to extract a _hexdump_ file into the original file?
- `xxd -r <filename>` returns a _binary_(.bin) dump from the _hexdump_ ['r' for Reverse]
- store it in a .bin file `xxd -r dump.txt > myfile.bin`
- But remeber the _hexdump_ file has to be created using `xxd` - Then only it can be reversed useg `-r`

### How to understand a bin file is made using _xxd_?
- Use `file <filename>` to get the info
- It can be
     - 🔑 gzip
     - 🔑 bzip2
     - 🔑 7zip
     - 🔑 tar - archived - POSIX tar archive (GNU)

### How To compress and extract files with various mechanisms?
* <span style="color:green"><b>ZIP</b> &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp; <I>Loose</I> - ★ ☆ ☆ ☆ ☆ </span><br>
```sh
zip myfile.bin # To Compress
unzip myfile.bin # To De-compress
```
* <span style="color:green"><b>GZIP</b> &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp; <I>Fast but Loose</I> - ★ ★ ☆ ☆ ☆ </span><br>
```sh
gzip myfile.bin # Compress
gunzip -c myfile.bin # De-compress
```
+ `-c` is used to peek and show it in STDOUT i.e. command line
+ We can use `gunzip myfile.gz` - It will replace the _myfile.gz_ with its extracted edition - <span style="color:red"> Be Cautious! 🤔</span>
+ Too peak and store it in another file  - `gunzip -c myfile.bin > data.txt` - <span style="color:green">No Head-scraching 😊</span>

* <span style="color:green"><b>BZIP2</b> &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp; <I>Swift & Better but Old-School</I> - ★ ★ ★ ☆ ☆ </span><br>
```sh
bzip2 myfile.bin # Compress
```
+ Replaces myfile.txt with a compressed file: myfile.txt.bz2
+ the original is gone unless you use the `-k` flag.
+ Some other Flags:
    - `-v`	Verbose
    - `-z`	Force compression (if acting like bunzip2)
    - `-f`	Force overwrite
    - `-1` to `-9`	Compression level: 1 = fast, 9 = best compression -> `bzip2 -9 -k myfile.txt`
```sh
bunzip2 -c myfile.bz2 # De-compress
OR
bzip2 -dc myfile.bz2 # De-compress(for GenZs)
```
+ `-d` is modern way to tell de-compress
+ `-c` is used to peek and show it in STDOUT i.e. command line
+ Any way we can use `... > data.txt` to store it and keep the original

### What Is a POSIX Tar Archive?
* <span style="color:blue"><b>TAR Archive</b></span><br>
  **Syntax**:: `tar [flags] destinationFileName sourceFileName`
    - Just a bundle of files and folders in one file (*.tar)
    - No compression by default! (That’s what gzip, bzip2, xz, etc. are for.)
    - `tar -cf backup.tar myfolder/` - Creates _backup.tar_ for the **archived** contents of _myfolder_
        + `-c`	Create a new archive. We use this flag whenever we need to create a new archive.
        + `-z`	Use gzip compression. When we specify this flag, it means that archive will be created using gzip compression.
        + `-v`	Provide verbose output. Providing the `-v` flag shows details of the files compressed.
        + `-f`	Archive file name. Archive file names are mapped using the `-f` flag.
        + `-x`	Extract from a compressed file. Use this flag when files need to be extracted from an archive. ✅
* When a file(tar file) says - `POSIX tar archive (GNU)` - This means it is a **_Standards-compliant tar archive_**
    + Refers to tar files that follow the POSIX.1-1988 or POSIX.1-2001 standard.
    + This ensures the archive is portable across Unix-like systems (Linux, macOS, etc.).
    + Defines the header format for things like file names, permissions, timestamps, etc.
    + **GNU** - this tar file was created (or at least recognized) by the GNU tar utility, the version of tar distributed with Linux.
        - Longer filenames
        - Sparse files
        - Hard links
        - Extra metadata beyond POSIX
    + **POSIX** ➕ **GNU** = follows _POSIX_ standard with some advance _GNU_ features
* <span style="color:yellow">Archive W/O compression of files</span>
```sh
tar -cf mydata.tar myfolder/    # Create tar
```
<br>

* <span style="color:yellow">Archive **With** compression of files</span>
```sh
tar -czf mydata.tar.gz myfolder/    # gzip
tar -cjf mydata.tar.bz2 myfolder/   # bzip2
tar -caf mydata.tar.xz myfolder/    # auto detect (newer tar)
```
<br>

* <span style="color:green">Extract TAR</span>
```sh
tar -xf archivedFiles.tar.gz    # Extact tar
tar -xzvf logs_archive.tar.gz   # '-z' flag specifies that the the compressed files are in gzip format. Similarly '-j' = bzip2
tar -tvf logs_archive.tar.gz    # Just to Peek inside a tar file. '-t' flag specifies that we need to only view the contents of the archive
```
![tar extract O/P](https://www.freecodecamp.org/news/content/images/2021/10/image-14.png)

### Working with **_gunzip_**
- gunzip only works on .gz files ✅ **Not**-  .zip, .bz2, .xz, or .tar.gz ❌
- If we try gunzip archive.tar.gz, we'll just get archive.tar, not the files inside the tar — for that use `tar -xzf archive.tar.gz`

    Command: `$  gunzip data8.bin`
    <br>O/P: <span style="color:purple">gzip: data8.bin: unknown suffix -- ignored</span>

    **Whats wrong**::
    ❌ gunzip expects filenames ending with .gz, .tgz, .z, etc.

    **Solution**<br>
    1. Force unzip the binary
        - ✅ `gunzip -S .bin data8.bin` === `-S` forces filetype to `.bin`
        - ✅ `gzip -d -S .bin data8.bin`
    2. Check File Type. Then de-compress
        - Step 1:  `file data8.bin`  O/P: <span style="color:purple">data8.bin: gzip compressed data...</span>
        - Step 2: As its a _gzip_ use `gunzip`
    3. Pro Players - with Magic Numbers
        - Step 1: `xxd data8.bin` or check first 16 bits `xxd -l 16 data8.bin`
            + `00000000: 1f8b ....`     === gzip | Hex: <span style="color:lime">1F 8B</span>   |  ASCII: <span style="color:lime"></span>
            + `00000000: 504b0304 ...`  === zip  | Hex: <span style="color:lime">50 4B 03 04</span>   |  ASCII: <span style="color:lime">PK..</span>
            + `00000000: 425a68...`     === bzip2 | Hex: <span style="color:lime">42 5A 68</span>   |  ASCII: <span style="color:lime">BZh</span>

### Few O/Ps during the de-Compress and Extraction process - For more insights, check out '[command.sh](commands.sh)'
```sh
OP:: prev2: gzip compressed data, was "data4.bin", last modi
OP:: prev3: POSIX tar archive (GNU)
OP:: -rw-r--r-- root/root     10240 2025-04-10 14:22 data5.bin
OP:: data6.bin: bzip2 compressed data, block size = 900k
```

### Finally tracked down the passwrd
- After multiple time de-Compress and Extractions of file we get the file which is simple ASCII Text 
```sh
file data8.bin
OP:: data8: ASCII text # Looks like this is it, if not a trick!
```

**Final Outcome**<br>
---
Password to next level:: `FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn`