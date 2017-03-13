# Load variables from variables.sh script
source ./scripts-eur/variables.sh

# Create the S3 bucket used for Kubernetes cluster configuration storage
aws s3api create-bucket --bucket ${DOMAIN_NAME}

# Create the Kubernetes cluster
kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --zones=${AWS_AVAIL_ZONES} --master-zones=${AWS_AVAIL_ZONES} --ssh-public-key="${AWS_KEYPAIR_PUB_KEY_PATH}" --kubernetes-version=1.6.0-beta.3 ${DOMAIN_NAME}
kops update cluster ${DOMAIN_NAME} --yes