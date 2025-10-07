#!/bin/bash

kcurl() {
    kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- \
    curl -s "$@" | grep -v '^pod "testpod" deleted'
}

# Check the response
if [[ $(kcurl http://hello-service:80) == "Hello from GREEN" ]]; then
    exit 0
else
    exit 1
fi