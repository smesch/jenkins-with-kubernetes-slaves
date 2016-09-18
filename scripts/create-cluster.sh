# Set KOPS_STATE_STORE variable
export KOPS_STATE_STORE=s3://${DOMAIN_NAME}
echo "export KOPS_STATE_STORE=s3://${DOMAIN_NAME}" >>~/.profile

# Create the cluster
kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --cloud=aws --zones=${AWS_AVAIL_ZONE} ${DOMAIN_NAME}
kops update cluster ${DOMAIN_NAME} --yes
