#!/bin/bash

[[ -n "$DEBUG" ]] && set -x
set -e

JENKINS_URL=${JENKINS_URL:-http://jenkins-leader-svc.default.svc.cluster.local}
KUBERNETES_URL=${KUBERNETES_URL:-https://kubernetes.default.svc.cluster.local}
KUBERNETES_SLAVE_IMAGE=${KUBERNETES_SLAVE_IMAGE:-smesch/jenkins-kubernetes-slave}
KUBERNETES_NAMESPACE=${KUBERNETES_NAMESPACE:-default}

sed -i \
    -e "s,\${JENKINS_URL\},$JENKINS_URL,g" \
    -e "s,\${KUBERNETES_URL\},$KUBERNETES_URL,g" \
    -e "s,\${KUBERNETES_SLAVE_IMAGE\},$KUBERNETES_SLAVE_IMAGE,g" \
    -e "s,\${KUBERNETES_NAMESPACE\},$KUBERNETES_NAMESPACE,g" \
    /usr/share/jenkins/ref/config.xml

/bin/tini -- /usr/local/bin/jenkins.sh
