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

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Clone repo go into /home/vagrant/ directory
    git clone https://github.com/smesch/jenkins-with-kubernetes-slaves.git /home/vagrant/jenkins-with-kubernetes-slaves/
  SHELL

  config.vm.provision "shell", path: "variables.sh", privileged: false, binary: false

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Run vagrant provisioning script and create cluster script
    /home/vagrant/jenkins-with-kubernetes-slaves/scripts/vagrant-provision.sh
    /home/vagrant/jenkins-with-kubernetes-slaves/scripts/create-cluster.sh
  SHELL

end