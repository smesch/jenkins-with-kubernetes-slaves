# Delete the cluster
/home/vagrant/bin/kops delete cluster ${DOMAIN_NAME} --yes

# Delete the persistent volume for Jenkins
JENKINS_KUBERNETES_VOLUME=$(aws ec2 describe-volumes --filters Name=tag-key,Values="Name" Name=tag-value,Values="jenkins-kubernetes-volume" --output text --query 'Volumes[*].VolumeId')
export JENKINS_KUBERNETES_VOLUME
aws ec2 delete-volume --volume-id $JENKINS_KUBERNETES_VOLUME

# Delete the S3 bucket
aws s3api delete-bucket --bucket ${DOMAIN_NAME} --region ${AWS_DEFAULT_REGION}