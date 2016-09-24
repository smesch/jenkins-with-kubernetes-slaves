# Install unzip & jq
sudo apt-get install unzip jq -y

# Install Go (v.1.7.1) 
wget --quiet https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz
rm go1.7.1.linux-amd64.tar.gz

    # Set the required paths for Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant
export PATH=$PATH:${GOPATH}/bin
echo "export PATH=$PATH:/usr/local/go/bin" >>~/.profile
echo "export GOPATH=/home/vagrant" >>~/.profile
echo "export PATH=$PATH:${GOPATH}/bin" >>~/.profile
. ~/.profile

# Install Kops (latest)
go get -d k8s.io/kops
cd ${GOPATH}/src/k8s.io/kops/
make

# Install AWS CLI (latest)
wget --quiet https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm awscli-bundle.zip

# Install Docker (latest)
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

# Install Kubectl (v.1.3.7)
wget --quiet https://storage.googleapis.com/kubernetes-release/release/v1.3.7/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl