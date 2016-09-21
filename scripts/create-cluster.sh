# Set variables from variables.sh script
./variables.sh

# Create S3 bucket
aws s3api create-bucket --region ${AWS_REGION} --bucket ${DOMAIN_NAME}

# Set KOPS_STATE_STORE variable
export KOPS_STATE_STORE=s3://${DOMAIN_NAME}
echo "export KOPS_STATE_STORE=s3://${DOMAIN_NAME}" >>~/.profile
. ~/.profile

# Create the cluster
${GOPATH}/bin/kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --cloud=aws --zones=${AWS_AVAIL_ZONE} ${DOMAIN_NAME}
${GOPATH}/bin/kops update cluster ${DOMAIN_NAME} --yes
