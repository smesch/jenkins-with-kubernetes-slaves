# Load variables from variables.sh script
source ./scripts/variables.sh

# Initialize Federation (Host is USA Cluster)
kubectl config use-context ${CLUSTER_CONTEXT_USA}
kubefed init ${FEDERATION_NAME} --host-cluster-context=${CLUSTER_CONTEXT_USA} --dns-provider=aws-route53 --dns-zone-name=${CLUSTER_CONTEXT_USA}

# Wait for Federation Controller & API to be deployed
echo "Waiting for the Federation Control Plane to initialize (180 seconds)"
sleep 180

# Join Clusters to Federation
kubectl config use-context ${FEDERATION_NAME}
kubefed join ${CLUSTER_NAME_EUR} --host-cluster-context=${CLUSTER_CONTEXT_USA} --cluster-context=${CLUSTER_CONTEXT_EUR} --secret-name=${CLUSTER_NAME_EUR}cluster
kubefed join ${CLUSTER_NAME_USA} --host-cluster-context=${CLUSTER_CONTEXT_USA} --cluster-context=${CLUSTER_CONTEXT_USA} --secret-name=${CLUSTER_NAME_USA}cluster