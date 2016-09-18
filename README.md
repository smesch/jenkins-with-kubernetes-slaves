# jenkins-with-kubernetes-slaves
On-demand Jenkins slaves within a Kubernetes cluster on AWS

# Pre-install Steps
* Install go
* Created project/golang folder and set it as GOPATH
* Add Kubectl to bin path (sudo cp kubernetes/platforms/darwin/amd64/kubectl /usr/local/bin/kubectl)
* Fixed ~/.bashrc with string in ~./bash_profile

# Install kops(first set GOPATH)
go get -d k8s.io/kops
cd ${GOPATH}/src/k8s.io/kops/
make

# ~/.bashrc contains:
export GOPATH=~/projects/golang
export KOPS_STATE_STORE=s3://{$DOMAIN_NAME}

# Creating the cluster
${GOPATH}/bin/kops create cluster --master-size=t2.micro --node-size=t2.micro --cloud=aws --zones=us-east-1b {$DOMAIN_NAME}
${GOPATH}/bin/kops update cluster {$DOMAIN_NAME} --yes

# Delete the cluster
${GOPATH}/bin/kops delete cluster {$DOMAIN_NAME} --yes

# Creating the persistent volume in AWS 
aws ec2 create-volume --region us-east-1 --availability-zone us-east-1b --size 32 --volume-type gp2




# Vagrant Setup
Pre-Install
* Install GO: https://golang.org/doc/install
* Install AWS CLI: http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-bundle-other-os
* Install KOPS: https://github.com/kubernetes/kops

Post Configuration
* Configure AWS CLI