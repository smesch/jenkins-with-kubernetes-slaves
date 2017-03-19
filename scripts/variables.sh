# Set versions for installations
export GO_VERSION="1.8"
export K8S_VERSION="1.5.4"
export KUBECTL_VERSION="1.5.4"
export KUBEFED_VERSION="1.5.4"
export KOPS_VERSION="1.5.3"

# General variables
export FEDERATION_NAME="fed"
export TOP_LEVEL_DOMAIN="c3group.io"
export CLUSTER_MASTER_SIZE="t2.micro"
export CLUSTER_NODE_SIZE="t2.micro"
export JENKINS_DOCKER_IMAGE="smesch/jenkins-kubernetes-leader-custom:2.32.3"
export AWS_KEYPAIR_PUB_KEY_PATH="~/.ssh/id_rsa.pub"

# USA variables
export CLUSTER_NAME_USA="usa"
export CLUSTER_CONTEXT_USA="k8s-${CLUSTER_NAME_USA}.${TOP_LEVEL_DOMAIN}"
export AWS_REGION_USA="us-east-1"
export AWS_AVAIL_ZONE_USA="us-east-1a"

# EUR variables
export CLUSTER_NAME_EUR="eur"
export CLUSTER_CONTEXT_EUR="k8s-${CLUSTER_NAME_EUR}.${TOP_LEVEL_DOMAIN}"
export AWS_REGION_EUR="eu-west-1"
export AWS_AVAIL_ZONE_EUR="eu-west-1a"