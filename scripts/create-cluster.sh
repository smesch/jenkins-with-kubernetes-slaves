# Create S3 bucket
aws s3api create-bucket --bucket ${DOMAIN_NAME} --region ${AWS_REGION}

# Set KOPS_STATE_STORE variable
export KOPS_STATE_STORE=s3://${DOMAIN_NAME}
echo "export KOPS_STATE_STORE=s3://${DOMAIN_NAME}" >>~/.profile

# Create the cluster
/home/vagrant/bin/kops create cluster --master-size=${CLUSTER_MASTER_SIZE} --node-size=${CLUSTER_NODE_SIZE} --cloud=aws --zones=${AWS_AVAIL_ZONE} ${DOMAIN_NAME}
/home/vagrant/bin/kops update cluster ${DOMAIN_NAME} --yes
