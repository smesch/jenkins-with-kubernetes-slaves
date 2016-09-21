# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
aws_default_region = ENV['AWS_DEFAULT_REGION']
ssh_public_key_path = "~/.ssh/id_rsa.pub"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

# Copy SSH public key for AWS to guest
  config.vm.provision "file", source: "#{ssh_public_key_path}", destination: "/home/vagrant/.ssh/id_rsa.pub"

# Copy AWS CLI configuration files to guest
#  config.vm.provision "file", source: "~/.aws/config", destination: "~/.aws/config"
#  config.vm.provision "file", source: "~/.aws/credentials", destination: "~/.aws/credentials"

# Install git and clone repo to /home/vagrant/jenkins-with-kubernetes-slaves/
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Install git
    sudo apt-get install git -y

    # Clone repo go into /home/vagrant/ directory
    git clone https://github.com/smesch/jenkins-with-kubernetes-slaves.git $HOME/jenkins-with-kubernetes-slaves/

    # Write ENV variables to .profile
    export AWS_ACCESS_KEY_ID=#{aws_access_key_id}
    export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}
    export AWS_DEFAULT_REGION=#{aws_default_region}

    # Remove AWS Key variables if they are empty
    if [ -z $AWS_ACCESS_KEY_ID ]; then unset AWS_ACCESS_KEY_ID; else echo "export AWS_ACCESS_KEY_ID=#{aws_access_key_id}" >>~/.profile; fi
    if [ -z $AWS_SECRET_ACCESS_KEY ]; then unset AWS_SECRET_ACCESS_KEY; else echo "export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}" >>~/.profile; fi
    if [ -z $AWS_DEFAULT_REGION ]; then unset AWS_DEFAULT_REGION; else echo "export AWS_DEFAULT_REGION=#{aws_default_region}" >>~/.profile; fi
  SHELL

# Run the local copies of the vagrant-provision.sh
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    $HOME/jenkins-with-kubernetes-slaves/scripts/provision-vagrant.sh
  SHELL

end