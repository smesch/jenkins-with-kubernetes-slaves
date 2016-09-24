# Set values for variables
export AWS_REGION="us-east-1"
export AWS_AVAIL_ZONE="us-east-1b"
export DOMAIN_NAME="jenkins.kubernetes.c3group.io"
export CLUSTER_MASTER_SIZE="t2.micro"
export CLUSTER_NODE_SIZE="t2.micro"
export JENKINS_DOCKER_IMAGE="smesch/jenkins-kubernetes-leader-custom:2.7.4"

# Set value the AWS EC2 key pair path ENV variable, such as "~/.ssh/id_rsa.pub"
# Leave as-is only if using Vagrant
export AWS_KEYPAIR_PUB_KEY_PATH="$AWS_KEYPAIR_PUB_KEY_PATH"

# Set KOPS_STATE_STORE to S3 bucket name (leave as-is)
export KOPS_STATE_STORE="s3://${DOMAIN_NAME}"