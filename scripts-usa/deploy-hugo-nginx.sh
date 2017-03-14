# Load variables from variables.sh script
source ./scripts-usa/variables.sh

# Create Kubernetes objects
kubectl --context ${DOMAIN_NAME} create -f ./kubernetes-hugo