#!/usr/bin/env bash

sudo apt-get update

## INSTALL VIM
sudo apt-get install vim

## INSTALL GIT
sudo apt-get install git

## INSTALL DOCKER
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER

## INSTALL TERRAFORM 
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform_0.11.7_linux_amd64.zip
rm terraform_0.11.7_linux_amd64.zip 
