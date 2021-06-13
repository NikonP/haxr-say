#!/bin/bash

echo "okay :("
echo "rm from /usr/bin/"
sudo rm /usr/bin/haxr-say

if [ $? -ne 0 ]; then
    echo "error!"
    exit 1
fi

echo "done!"
