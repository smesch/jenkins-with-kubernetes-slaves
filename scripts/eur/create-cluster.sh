# Load variables from variables.sh script
source ./scripts/variables.sh

# Set KOPS_STATE_STORE to S3 bucket name (leave as-is)
export KOPS_STATE_STORE="s3://${CLUSTER_CONTEXT_EUR}"

# Create the S3 bucket used for Kubernetes cluster configuration storage
aws s3api create-bucket --bucket ${CLUSTER_CONTEXT_EUR}

# Create the Kubernetes cluster
kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --zones=${AWS_AVAIL_ZONE_EUR} --dns-zone=${CLUSTER_CONTEXT_EUR} --ssh-public-key="${AWS_KEYPAIR_PUB_KEY_PATH}" --kubernetes-version=${K8S_VERSION} ${CLUSTER_CONTEXT_EUR}
kops update cluster ${CLUSTER_CONTEXT_EUR} --yes