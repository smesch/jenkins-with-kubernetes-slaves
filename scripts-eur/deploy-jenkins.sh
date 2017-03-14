# Load variables from variables.sh script
source ./scripts-eur/variables.sh

# Check if there is already a volume available in AWS EC2 with a Name tag value of "jenkins-kubernetes-volume"
export JENKINS_KUBERNETES_VOLUME_CHECK=$(aws ec2 describe-volumes --region ${AWS_REGION} --filters Name=tag-key,Values="Name" Name=tag-value,Values="jenkins-kubernetes-volume" --output text --query 'Volumes[*].VolumeId')

# Create an AWS EC2 volume for Jenkins and replace the VolumeID in the jenkins-kubernetes-leader-per-vol.yaml file
if [[ -z "$JENKINS_KUBERNETES_VOLUME_CHECK" ]]; then
    export JENKINS_KUBERNETES_VOLUME=$(aws ec2 create-volume --region ${AWS_REGION} --availability-zone ${AWS_AVAIL_ZONE} --size 32 --volume-type gp2 | jq -r ".VolumeId")
    aws ec2 create-tags --region ${AWS_REGION} --resources $JENKINS_KUBERNETES_VOLUME --tags Key=Name,Value=jenkins-kubernetes-volume
    sed -i -e "s/vol-.*/$JENKINS_KUBERNETES_VOLUME/g" ./kubernetes/jenkins-kubernetes-leader-per-vol.yaml
fi

# Set Jenkins Docker image name in the jenkins-kubernetes-leader-deploy.yaml file
sed -i -e "s|image: .*|image: $JENKINS_DOCKER_IMAGE|g" ./kubernetes/jenkins-kubernetes-leader-deploy.yaml

# Create Kubernetes objects
kubectl --context ${CLUSTER_NAME} create -f ./kubernetes