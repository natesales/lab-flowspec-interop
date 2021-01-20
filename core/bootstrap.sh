#!/bin/bash

sudo apt install -y gnupg2

# Install FRR
curl -s https://deb.frrouting.org/frr/keys.asc | sudo apt-key add -
echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable | sudo tee /etc/apt/sources.list.d/frr.list
sudo apt update
sudo apt install -y frr frr-pythontools

# Enable FRR bgpd
sudo sed -i "s/^bgpd=no/bgpd=yes/" /etc/frr/daemons
sudo systemctl restart frr