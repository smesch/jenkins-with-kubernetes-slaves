# Retreive ELB URL
export JENKINS_ELB=$(kubectl --context=k8s-usa.c3group.io get services/jenkins-leader-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")

# Add to JSON file
sed -i -e 's|"Value": ".*|"Value": "'"$JENKINS_ELB"'"|g' dns-records/jenkins-leader.json

# Create DNS records
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://dns-records/jenkins-leader.json