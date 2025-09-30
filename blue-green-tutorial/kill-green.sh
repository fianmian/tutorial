#!/bin/bash

# Simulate failure: patch hello-green with a bad image
kubectl set image deployment/hello-green hello-green=hashicorp/http-echo:doesnotexist --record >/dev/null 2>&1

echo "⚠️ Simulated failure: green deployment updated to a bad image"
