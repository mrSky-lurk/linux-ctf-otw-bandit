# To decode the data.txt
base64 -d data.txt

# Sometime we need to conver to human readable form before decoding
strings data.txt | base64 -d