# Create temp dir using a unique name
mktemp -d "mrSky_XXXXXX" # 6 X's will be replaced by unique chars
O/P:: Permission Denaied

# Create temp dir using a unique name
mktemp -d
OR
mktemp -d 'mrSky_YU90IO80' # Self derived unique name

# Copy and Rename data.txt
cp data.txt /tmp/mrSky_YU90IO80
# Go to temp Dir
cd /tmp/mrSky_YU90IO80
# Rename data.txt in mrSky folder
mv data.txt hexdump.txt

# check type of hexdump - xxd or hexdump
hexdump -C hexdump.txt
O/P:: `00000000: 4865 6c6c 6f20 576f 726c 640a  ghv _+_^!@#VBA` # Turns out this a xxd type hexdump

# Hexdump to Binary file
xxd -r hexdump.txt > hexdump.bin # converts to a binary file === binary file that is the result of compressing the key file n times

# Check the the type of compressed file
file hexdump.bin
O/P:: newbin.bin: gzip compressed data, was "data2.bin", last modif.....

# unzip the file with gzip mechanism and store it to prev1
gunzip hexdump.bin > prev1


# Check the the type of prev1 
file prev1
OP:: prev1.bin: bzip2 compressed data, block size = 900k

# various outputs when we use 'file' to checkthe type and unzip/extract accordingly
OP:: prev2: gzip compressed data, was "data4.bin", last modi
OP:: prev3: POSIX tar archive (GNU)
OP:: -rw-r--r-- root/root     10240 2025-04-10 14:22 data5.bin
OP:: data6.bin: bzip2 compressed data, block size = 900k

# check this - data6.bin is bzip2 compressed data-
bzip2 -dc data6.bin
OP:: "data8.bin0000644000000000000000000000011714775752101011257 0ustar  rootrooA��gdata9.bin
 �HU(H,..�/JQ�,Vp�7M)w+N6HNJ���0Ȱ��.6*K   q)w��>�2A1bandit12@"
 # After unzip, it returns a archived file(tar)
 # As -c converts the output into a STDOUT and hence it all looks like garbage output

# Solution
bzip2 -d data6.bin
OP:: "bzip2: Can't guess original name for data6.bin -- using data6.bin.out" # It is unzipped but it canot guess the file

# If we ls -l at this point we see- 
ls -lt
OP:: data5.bin      data8      dump3.txt  hexdump.txt  newdump.txt  prev2
    *data6.bin.out*  dump2.txt  dump4.txt  newbin.bin   prev1.bin    prev3

file data6.bin.out
OP:: data6.bin.out: POSIX tar archive (GNU)

tar -tvf data6.bin.out
OP:: '-rw-r--r-- root/root   79 2025-04-10 14:22 data8.bin'

tar -xvf data6.bin.out # We get the data8.bin

# and finally we get the password in data8.bin
file data8.bin
OP:: data8: ASCII text

cat data8.bin
OP:: 'pwd'

