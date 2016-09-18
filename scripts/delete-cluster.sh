# Delete the cluster and the persistent volume for Jenkins
kops delete cluster ${DOMAIN_NAME} --yes
JENKINS_KUBERNETES_VOLUME=$(aws ec2 describe-volumes --filters Name=tag-key,Values="Name" Name=tag-value,Values="jenkins-kubernetes-volume" --output text --query 'Volumes[*].VolumeId')
export JENKINS_KUBERNETES_VOLUME
aws ec2 delete-volume --volume-id $JENKINS_KUBERNETES_VOLUME