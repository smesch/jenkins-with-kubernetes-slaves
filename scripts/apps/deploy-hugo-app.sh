# Load variables from variables.sh script
source ./scripts/variables.sh

# Create Kubernetes objects
kubectl --context ${FEDERATION_NAME} create -f ./kubernetes/hugo