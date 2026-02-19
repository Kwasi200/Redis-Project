
#!/bin/bash

set -e

echo "Applying Redis ConfigMap..."
kubectl apply -f ../k8s/redis-configmap.yaml

   sleep 1

echo "Applying Redis Secret...."
kubectl apply -f ../k8s/redis-secret.yaml

   sleep 1

echo "Applying Redis PVC..."
kubectl apply -f ../k8s/redis-pvc.yaml
   sleep 1

echo "Applying Redis Deployment and Service...."
kubectl apply -f ../k8s/redis-deployment.yaml
kubectl apply -f ../k8s/redis-service.yaml
    sleep 1
echo "Applying FastAPI Deployment and Service..."
kubectl apply -f ../k8s/deployment.yaml
kubectl apply -f ../k8s/service.yaml
 
sleep 1

echo "Implementing  Port Forwarding..."
kubectl port-forward svc/python-api  30080:80
  sleep 1

echo "All resources applied successfully."


