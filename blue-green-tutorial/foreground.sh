#!/bin/bash

git clone https://github.com/fianmian/tutorial.git

mkdir -p /root/assets
cp -r tutorial/blue-green-tutorial/assets/* /root/assets/

# Make all scripts executable
chmod +x /root/assets/*.sh

rm -rf tutorial/

clear

