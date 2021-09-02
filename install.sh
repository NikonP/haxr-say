#!/bin/bash
# flag for ptzctf: ptzctf{haxr_asks_haxr}

echo "chmod +x"
chmod +x haxr-say.sh
echo "cp to /usr/bin/"
sudo cp haxr-say.sh /usr/bin/haxr-say

if [ $? -ne 0 ]; then
    echo "error!"
    exit 1
fi

echo "done!"

if ! command -v lolcat &>/dev/null; then
    echo "lolcat is not installed!"
    echo "diy please :) https://github.com/busyloop/lolcat"
else
    echo "lolcat is installed!"
    echo "yay!"
fi
