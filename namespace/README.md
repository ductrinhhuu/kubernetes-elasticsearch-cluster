# Suppose there exists a Kubernetes cluster 

# Create persistent volume for stateful data initialization
kubectl apply -f pv-data.yml

# Create master pod
kubectl apply -f es-master.yml

# Create data pod (stateful deployment)
kubectl apply -f es-data.yml

# Create client pod - also load balancer
kubectl apply -f es-client.yml

# Check log of master node
kubectl -n elasticsearch logs <pod-id> | grep ClusterApplierService