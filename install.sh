#!/bin/bash
set -e
set -x

# need to run from home directory
cd ~/

sudo apt-get install -y --force-yes jq dnsutils inadyn 
sudo apt-get install -y --force-yes usb-modeswitch modemmanager 
sudo apt-get install -y --force-yes network-manager 

sudo systemctl disable dnsmasq

sudo sed -i.bak -e '/^\[main\]/aauth-polkit=false' /etc/NetworkManager/NetworkManager.conf

./wifi.sh

sudo reboot
