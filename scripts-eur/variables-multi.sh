# Set values for variables
export AWS_REGION="eu-west-1"
export AWS_AVAIL_ZONE="eu-west-1a"
export AWS_AVAIL_ZONES="eu-west-1a,eu-west-1b,eu-west-1c"
export DOMAIN_NAME="k8s-eur.c3group.io"
export CLUSTER_MASTER_SIZE="t2.micro"
export CLUSTER_NODE_SIZE="t2.micro"
export JENKINS_DOCKER_IMAGE="smesch/jenkins-kubernetes-leader-custom:2.32.3"
export AWS_KEYPAIR_PUB_KEY_PATH="~/.ssh/id_rsa.pub"

# Set KOPS_STATE_STORE to S3 bucket name (leave as-is)
export KOPS_STATE_STORE="s3://${DOMAIN_NAME}"