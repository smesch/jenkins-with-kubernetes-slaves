# Install unzip & jq
sudo apt-get install unzip jq -y

# Install Go 
wget --quiet https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.linux-amd64.tar.gz

# Set the required paths for Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant
export PATH=$PATH:${GOPATH}/bin
echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile
echo "export GOPATH=/home/vagrant" >>~/.profile
echo "export PATH=$PATH:${GOPATH}/bin" >>~/.profile
. ~/.profile

# Install AWS CLI (latest)
wget --quiet https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm awscli-bundle.zip

# Install Docker (latest)
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

# Install Kubectl
wget --quiet https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

# Install Kubefed
wget --quiet https://storage.googleapis.com/kubernetes-release/release/v${KUBEFED_VERSION}/bin/linux/amd64/kubefed
sudo chmod +x kubefed
sudo mv kubectl /usr/local/bin/kubefed

# Install Kops
wget --quiet https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64
sudo chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops