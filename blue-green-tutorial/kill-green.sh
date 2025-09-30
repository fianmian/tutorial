# Kill green pods to simulate failure
kubectl delete pods -l app=hello,version=green --force --grace-period=0

echo "⚠️ Simulated failure: green pods terminated"