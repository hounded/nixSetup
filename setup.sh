#!/usr/bin/env bash

sudo apt-get update

## INSTALL PYTHON 2.7
pythonFile="which python"
if [ -f "$(eval $pythonFile)" ]; then
	python -V
else
	echo "INSTALLING PYTHON"
	sudo apt-get install -y python 
	python -V
fi 
## INSTALL VIM
fileVim="which vim"
if [ -f "$(eval $pythonFile)" ]; then
	echo "VIM INSTALLED"
else
	sudo apt-get install -y vim
fi

## INSTALL GIT
fileGit="which git"
if [ -f "$(eval $fileGit)" ]; then 
	git --version
else
	sudo apt-get install -y git
fi

## INSTALL DOCKER
fileDocker="which docker"
if [ -f "$(eval $fileDocker)" ]; then 
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
	echo "export PATH=$PATH:~/$PWD">>~/.bashrc
fi
## INSTALL GCP SDK
fileGcloud="which gcloud"
if [ -f "$(eval $fileGcloud)" ]; then
	gcloud --version
else
	wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-204.0.0-linux-x86_64.tar.gz
	tar -xvf google-cloud-sdk-204.0.0-linux-x86_64.tar.gz
	./google-cloud-sdk/install.sh
fi

