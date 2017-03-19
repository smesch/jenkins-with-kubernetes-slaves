# Load variables from variables.sh script
source ./scripts/variables.sh

# Retreive ELB URL
export HUGO_APP_ELB_USA=$(kubectl --context=${CLUSTER_CONTEXT_USA} get services/hugo-app-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")
export HUGO_APP_ELB_EUR=$(kubectl --context=${CLUSTER_CONTEXT_EUR} get services/hugo-app-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")

# Add to JSON file
sed -i -e 's|"Value": ".*|"Value": "'"${HUGO_APP_ELB_USA}"'"|g' scripts/dns/hugo-app-usa.json
sed -i -e 's|"Value": ".*|"Value": "'"${HUGO_APP_ELB_EUR}"'"|g' scripts/dns/hugo-app-eur.json
sed -i -e 's|TOP_LEVEL_DOMAIN|'"${TOP_LEVEL_DOMAIN}"'|g' scripts/dns/hugo-app-usa.json
sed -i -e 's|TOP_LEVEL_DOMAIN|'"${TOP_LEVEL_DOMAIN}"'|g' scripts/dns/hugo-app-eur.json
sed -i -e 's|AWS_REGION_USA|'"${AWS_REGION_USA}"'|g' scripts/dns/hugo-app-usa.json
sed -i -e 's|AWS_REGION_EUR|'"${AWS_REGION_EUR}"'|g' scripts/dns/hugo-app-eur.json

# Create DNS records
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://scripts/dns/hugo-app-usa.json
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://scripts/dns/hugo-app-eur.json