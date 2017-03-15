# Load variables from variables.sh script
source ./scripts/variables.sh

# Initialize Federation (Host is USA Cluster)
kubectl config use-context ${CLUSTER_CONTEXT_USA}
kubefed init k8sfed --host-cluster-context=${CLUSTER_CONTEXT_USA} --dns-provider=aws-route53 --dns-zone-name=${CLUSTER_CONTEXT_USA}

# Wait for Federation Controller & API to be deployed
sleep 60

# Join Clusters to Federation
kubectl config use-context k8sfed
kubefed join ${CLUSTER_NAME_EUR} --host-cluster-context=${CLUSTER_CONTEXT_USA} --cluster-context=${CLUSTER_CONTEXT_EUR} --secret-name=${CLUSTER_NAME_EUR}
kubefed join ${CLUSTER_NAME_USA} --host-cluster-context=${CLUSTER_CONTEXT_USA} --cluster-context=${CLUSTER_CONTEXT_USA} --secret-name=${CLUSTER_NAME_USA}