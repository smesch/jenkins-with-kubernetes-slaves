# Load variables from variables.sh script
source ./scripts-usa/variables.sh

# Create Kubernetes objects
kubectl --context ${CLUSTER_NAME} create -f ./kubernetes-hugo