#!/bin/bash

kcurl() {
    kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- \
    curl -s "$@" | grep -v '^pod "testpod" deleted'
}