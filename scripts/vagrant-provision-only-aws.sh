    # Install git, unzip & jq
    sudo apt-get install unzip jq -y

    # Download and install AWS CLI
    wget --quiet https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
    unzip awscli-bundle.zip
    sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    rm awscli-bundle.zip