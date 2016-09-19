# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

# Copy SSH public key for AWS to guest
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

# Install git and clone repo to /home/vagrant/jenkins-with-kubernetes-slaves/
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Install git
    sudo apt-get install git -y
    # Clone repo go into /home/vagrant/ directory
    git clone https://github.com/smesch/jenkins-with-kubernetes-slaves.git /home/vagrant/jenkins-with-kubernetes-slaves/
  SHELL

# Copy and run variables.sh script on guest
#  config.vm.provision "shell", path: "variables.sh", privileged: false, binary: false

# Run the local copies of the vagrant-provision.sh & create-cluster.sh
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Run vagrant provisioning script and create cluster script
    /home/vagrant/jenkins-with-kubernetes-slaves/scripts/vagrant-provision-only-aws.sh
#    /home/vagrant/jenkins-with-kubernetes-slaves/scripts/create-cluster.sh
  SHELL

# Copy AWS CLI configuration files to guest
  config.vm.provision "file", source: "~/.aws/config", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "file", source: "~/.aws/credentials", destination: "/home/vagrant/.ssh/id_rsa.pub"

end