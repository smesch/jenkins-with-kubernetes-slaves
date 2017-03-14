# Load variables from variables.sh script
source ./scripts-eur/variables.sh

# Create Kubernetes objects
kubectl --context ${CLUSTER_NAME} create -f ./kubernetes-hugo