#!/bin/bash
sleep 15
kubectl set image deployment/hello-green hello-green=hashicorp/http-echo:doesnotexist --record
echo "⚠️ Simulated failure: green deployment updated to bad image"