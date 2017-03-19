# Load variables from variables.sh script
source ./scripts/variables.sh

# Retreive ELB URL
export JENKINS_ELB=$(kubectl --context=${CLUSTER_CONTEXT_USA} get services/jenkins-leader-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")

# Add to JSON file
sed -i -e 's|"Value": ".*|"Value": "'"${JENKINS_ELB}"'"|g' scripts/dns/jenkins.json
sed -i -e 's|TOP_LEVEL_DOMAIN|'"${TOP_LEVEL_DOMAIN}"'|g' scripts/dns/jenkins.json

# Create DNS records
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://scripts/dns/jenkins.json