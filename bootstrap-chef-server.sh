#!/usr/bin/env bash

echo "This script installs Chef on your server (debian/ubuntu)"
echo "Press return key to continue or CTRL-C to abort"
read x

echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list
sudo mkdir -p /etc/apt/trusted.gpg.d
sudo mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
sudo rm -f /etc/apt/trusted.gpg.d/opscode-keyring.gpg
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
sudo apt-get -y update
sudo apt-get -y install opscode-keyring

sudo apt-get -y upgrade

sudo apt-get -y install chef chef-server

mkdir -p ~/.chef
sudo cp /etc/chef/validation.pem /etc/chef/webui.pem ~/.chef
sudo chown -R $USER ~/.chef

knife configure -i

