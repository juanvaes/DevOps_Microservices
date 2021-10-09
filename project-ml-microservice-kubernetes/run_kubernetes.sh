   
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=juanvaes/flask-app-devops

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flask-app-devops --image=$dockerpath:latest --port=80 --labels app=ml-app
kubectl wait pod/flask-app-devops --for=condition=Ready --timeout=-1s
# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward flask-app-devops 8000:80
kubectl logs flask-app-devops  