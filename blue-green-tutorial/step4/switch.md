# Step 4 - Traffic Switch

Switch from blue --> to green:
`kubectl patch svc hello-service -p '{"spec":{"selector":{"app":"hello","version":"green"}}}'`

Check the endpoints of our service, should now be green's IP addresses:
`kubectl get endpoints hello-service`

Verify traffic:
`kubectl run -it --rm testpod --image=curlimages/curl --restart=Never -- curl http://hello-service:80`
should now return **Hello from GREEN**