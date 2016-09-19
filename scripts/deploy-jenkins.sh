# Create persistent volume for Jenkins, capture the VolumeID as a env variable, tag it with a name and replace the VolumeID in the jenkins-kubernetes-leader-per-vol.yaml file
JENKINS_KUBERNETES_VOLUME=$(aws ec2 create-volume --region ${AWS_DEFAULT_REGION} --availability-zone ${AWS_AVAIL_ZONE} --size 32 --volume-type gp2 | jq -r ".VolumeId")
export JENKINS_KUBERNETES_VOLUME
aws ec2 create-tags --resources $JENKINS_KUBERNETES_VOLUME --tags Key=Name,Value=jenkins-kubernetes-volume
sed -i -e "s/vol-.*/$JENKINS_KUBERNETES_VOLUME/g" /home/vagrant/jenkins-with-kubernetes-slaves/kubernetes/jenkins-kubernetes-leader-per-vol.yaml

# Create Kubernetes objects
kubectl create -f /home/vagrant/jenkins-with-kubernetes-slaves/kubernetes