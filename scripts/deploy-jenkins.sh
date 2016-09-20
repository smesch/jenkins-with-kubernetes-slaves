# Check if there is already a volume available in AWS EC2 with a Name tag value of "jenkins-kubernetes-volume"
JENKINS_KUBERNETES_VOLUME_CHECK=$(aws ec2 describe-volumes --region ${AWS_REGION} --filters Name=tag-key,Values="Name" Name=tag-value,Values="jenkins-kubernetes-volume" --output text --query 'Volumes[*].VolumeId')
export JENKINS_KUBERNETES_VOLUME_CHECK

# Create persistent volume for Jenkins, capture the VolumeID as a env variable, tag it with a name and replace the VolumeID in the jenkins-kubernetes-leader-per-vol.yaml file
if [[ -z "$JENKINS_KUBERNETES_VOLUME_CHECK" ]]; then
    JENKINS_KUBERNETES_VOLUME=$(aws ec2 create-volume --region ${AWS_REGION} --availability-zone ${AWS_AVAIL_ZONE} --size 32 --volume-type gp2 | jq -r ".VolumeId")
    export JENKINS_KUBERNETES_VOLUME
    aws ec2 create-tags --region ${AWS_REGION} --resources $JENKINS_KUBERNETES_VOLUME --tags Key=Name,Value=jenkins-kubernetes-volume
    sed -i -e "s/vol-.*/$JENKINS_KUBERNETES_VOLUME/g" /home/vagrant/jenkins-with-kubernetes-slaves/kubernetes/jenkins-kubernetes-leader-per-vol.yaml
fi

# Create Kubernetes objects
kubectl create -f /home/vagrant/jenkins-with-kubernetes-slaves/kubernetes