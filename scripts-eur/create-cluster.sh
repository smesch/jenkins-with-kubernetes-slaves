# Load variables from variables.sh script
source ./scripts-eur/variables.sh

# Create the S3 bucket used for Kubernetes cluster configuration storage
aws s3api create-bucket --bucket ${DOMAIN_NAME}

# Create the Kubernetes cluster
kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --zones=${AWS_AVAIL_ZONES} --dns-zone=${DOMAIN_NAME} --ssh-public-key="${AWS_KEYPAIR_PUB_KEY_PATH}" --kubernetes-version=${K8S_VERSION} ${CLUSTER_NAME}
kops update cluster ${CLUSTER_NAME} --yes