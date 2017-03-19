# Load variables from variables.sh script
source ./scripts/variables.sh

# Set KOPS_STATE_STORE to S3 bucket name (leave as-is)
export KOPS_STATE_STORE="s3://${CLUSTER_CONTEXT_EUR}"

# Delete the Kubernetes cluster
kops delete cluster ${CLUSTER_CONTEXT_EUR} --yes

# Delete the S3 bucket used for Kubernetes cluster configuration storage
aws s3api delete-bucket --bucket ${CLUSTER_CONTEXT_EUR}