# Set values for variables
export AWS_REGION=us-east-1
export AWS_AVAIL_ZONE=us-east-1b
export DOMAIN_NAME=jenkins.kubernetes.c3group.io
export CLUSTER_MASTER_SIZE=t2.micro
export CLUSTER_NODE_SIZE=t2.micro

# Set KOPS_STATE_STORE to S3 bucket name
export KOPS_STATE_STORE=s3://${DOMAIN_NAME}