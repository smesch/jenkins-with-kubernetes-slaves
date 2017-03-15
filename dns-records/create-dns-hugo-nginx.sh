# Retreive ELB URL
export HUGO_NGINX_ELB_USA=$(kubectl --context=k8s-usa.c3group.io get services/hugo-nginx-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")
export HUGO_NGINX_ELB_EUR=$(kubectl --context=k8s-eur.c3group.io get services/hugo-nginx-svc --template="{{range .status.loadBalancer.ingress}} {{.hostname}} {{end}}")

# Add to JSON file
sed -i -e "s|HUGO_NGINX_ELB_USA|$HUGO_NGINX_ELB_USA|g" dns-records/hugo-nginx-usa.json
sed -i -e "s|HUGO_NGINX_ELB_EUR|$HUGO_NGINX_ELB_EUR|g" dns-records/hugo-nginx-eur.json

# Create DNS records
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://dns-records/hugo-nginx-usa.json
aws route53 change-resource-record-sets --hosted-zone-id ZUBW5UMTX1U8P --change-batch file://dns-records/hugo-nginx-eur.json