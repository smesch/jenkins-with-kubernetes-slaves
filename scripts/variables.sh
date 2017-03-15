# Set values for variables
export FEDERATION_NAME="fed"
export CLUSTER_NAME_USA="usa"
export CLUSTER_NAME_EUR="eur"
export TOP_LEVEL_DOMAIN="c3group.io"
export CLUSTER_CONTEXT_USA="k8s-${CLUSTER_NAME_USA}.${TOP_LEVEL_DOMAIN}"
export CLUSTER_CONTEXT_EUR="k8s-${CLUSTER_NAME_EUR}.${TOP_LEVEL_DOMAIN}"
export JENKINS_DOCKER_IMAGE="smesch/jenkins-kubernetes-leader-custom:2.32.3"

# Set versions for installations
export GO_VERSION="1.8"
export K8S_VERSION="1.5.4"
export KUBECTL_VERSION="1.5.4"
export KUBEFED_VERSION="1.5.4"
export KOPS_VERSION="1.5.3"
