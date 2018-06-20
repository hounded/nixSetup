#!/usr/bin/env bash

sudo apt-get update

## INSTALL PYTHON 2.7
if [ -f "$(which python)" ]; then
	python -V
else
	echo "INSTALLING PYTHON"
	sudo apt-get install -y python 
	python -V
fi 
## INSTALL VIM
if [ -f "$(which vim)" ]; then
	echo "VIM INSTALLED"
else
	sudo apt-get install -y vim
fi

## INSTALL GIT
if [ -f "$(which git)" ]; then 
	git --version
else
	sudo apt-get install -y git
fi
## INSTALL DOCKER
if [ -f "$(which docker)" ]; then 
	docker -v
else
	sudo apt install -y docker.io
	sudo systemctl start docker
	sudo systemctl enable docker
	sudo groupadd docker
	sudo usermod -aG docker $USER
fi
## INSTALL TERRAFORM 
if [ -f "$PWD/terraform" ]; then
 	terraform --version
 else
	 echo "DOWNLOADING TERRAFORM"
	wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
	unzip terraform_0.11.7_linux_amd64.zip
	rm terraform_0.11.7_linux_amd64.zip 
	echo "export PATH=$PATH:$PWD">>~/.bashrc
fi
## INSTALL GCP SDK
if [ -f "$(which gcloud)" ]; then
	gcloud --version
else
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-204.0.0-linux-x86_64.tar.gz
	tar -xvf google-cloud-sdk-204.0.0-linux-x86_64.tar.gz
	rm google-cloud-sdk-204.0.0-linux-x86_64.tar.gz
	./google-cloud-sdk/install.sh 
fi
## INSTALL KUBECTL
if [ -f "$(which kubectl)" ]; then
	kubectl version
else 
	sudo apt-get install -y apt-transport-https curl
	sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
	sudo apt-get update
	sudo apt-get install -y kubectl
fi

bash
