# Set values for variables
export AWS_REGION="eu-central-1"
export AWS_AVAIL_ZONE="eu-central-1a"
export AWS_AVAIL_ZONES="eu-central-1a,eu-central-1b"
export DOMAIN_NAME="k8s-eu.c3group.io"
export CLUSTER_MASTER_SIZE="t2.micro"
export CLUSTER_NODE_SIZE="t2.micro"
export JENKINS_DOCKER_IMAGE="smesch/jenkins-kubernetes-leader-custom:2.32.3"
export AWS_KEYPAIR_PUB_KEY_PATH="~/.ssh/id_rsa.pub"

# Set KOPS_STATE_STORE to S3 bucket name (leave as-is)
export KOPS_STATE_STORE="s3://${DOMAIN_NAME}"