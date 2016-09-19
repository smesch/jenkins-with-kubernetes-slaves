# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
aws_default_region = "us-east-1"
aws_avail_zone = "us-east-1b"
domain_name = "kubernetes.your-domain.com"
cluster_master_size = "t2.micro"
cluster_node_size = "t2.micro"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

# Copy SSH public key for AWS to guest
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

# Copy AWS CLI configuration files to guest
  config.vm.provision "file", source: "~/.aws/config", destination: "~/.aws/config"
  config.vm.provision "file", source: "~/.aws/credentials", destination: "~/.aws/credentials"

# Install git and clone repo to /home/vagrant/jenkins-with-kubernetes-slaves/
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Install git
    sudo apt-get install git -y
    # Clone repo go into /home/vagrant/ directory
    git clone https://github.com/smesch/jenkins-with-kubernetes-slaves.git /home/vagrant/jenkins-with-kubernetes-slaves/
    # Write ENV variables to .profile
    echo "export AWS_ACCESS_KEY_ID=#{aws_access_key_id}" >>~/.profile
    echo "export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}" >>~/.profile
    echo "export AWS_DEFAULT_REGION=#{aws_default_region}" >>~/.profile
    echo "export AWS_AVAIL_ZONE=#{aws_avail_zone}" >>~/.profile
    echo "export DOMAIN_NAME=#{domain_name}" >>~/.profile
    echo "export CLUSTER_MASTER_SIZE=#{cluster_master_size}" >>~/.profile
    echo "export CLUSTER_NODE_SIZE=#{cluster_node_size}" >>~/.profile
    . ~/.profile
  SHELL

# Copy and run variables.sh script on guest
  config.vm.provision "shell", path: "./scripts/variables.sh", privileged: false, binary: false

# Run the local copies of the vagrant-provision.sh
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    /home/vagrant/jenkins-with-kubernetes-slaves/scripts/vagrant-provision.sh
  SHELL

end