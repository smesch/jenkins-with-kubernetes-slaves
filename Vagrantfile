# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Defining AWS CLI ENV variables from host
aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
aws_default_region = ENV['AWS_DEFAULT_REGION']

# Path to SSH public key for the AWS EC2 key pair from host
aws_keypair_pub_key_path = "~/.ssh/id_rsa.pub"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

# Copy SSH public key for AWS to guest
  config.vm.provision "file", source: "#{aws_keypair_pub_key_path}", destination: "/home/vagrant/.ssh/id_rsa.pub"

# Copy AWS CLI configuration files to guest (uncomment if you used "aws configure" to configure you AWS CLI instead of ENV variables)
#  config.vm.provision "file", source: "~/.aws/config", destination: "~/.aws/config"
#  config.vm.provision "file", source: "~/.aws/credentials", destination: "~/.aws/credentials"

# Install git and clone git repoistory | Write AWS CLI config ENV variables to ~/.profile on guest
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    # Install git
    sudo apt-get install git -y

    # Clone git repository into $HOME/jenkins-with-kubernetes-slaves/ directory
    git clone https://github.com/smesch/jenkins-with-kubernetes-slaves.git $HOME/jenkins-with-kubernetes-slaves/

    # Export AWS CLI ENV variables on guest
    export AWS_ACCESS_KEY_ID=#{aws_access_key_id}
    export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}
    export AWS_DEFAULT_REGION=#{aws_default_region}

    # Write AWS CLI ENV variables to ~/.profile on guest if they are populated | Remove if they are empty
    if [ -z $AWS_ACCESS_KEY_ID ]; then unset AWS_ACCESS_KEY_ID; else echo "export AWS_ACCESS_KEY_ID=#{aws_access_key_id}" >>~/.profile; fi
    if [ -z $AWS_SECRET_ACCESS_KEY ]; then unset AWS_SECRET_ACCESS_KEY; else echo "export AWS_SECRET_ACCESS_KEY=#{aws_secret_access_key}" >>~/.profile; fi
    if [ -z $AWS_DEFAULT_REGION ]; then unset AWS_DEFAULT_REGION; else echo "export AWS_DEFAULT_REGION=#{aws_default_region}" >>~/.profile; fi
  SHELL

# Run the local copy of the provision-vagrant.sh script
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    $HOME/jenkins-with-kubernetes-slaves/scripts/provision-vagrant.sh
  SHELL

end