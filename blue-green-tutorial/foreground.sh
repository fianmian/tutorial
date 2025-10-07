#!/bin/bash
kcurl() {
    kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- \
    curl -s "$@" | grep -v '^pod "testpod" deleted'
}

git clone https://github.com/fianmian/tutorial.git

mkdir -p /root/assets
cp -r tutorial/blue-green-tutorial/assets/* /root/assets/

# Make all scripts executable
chmod +x /root/assets/*.sh

rm -rf tutorial/

clear

