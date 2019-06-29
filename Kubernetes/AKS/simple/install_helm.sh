#!/bin/sh


echo "Setting Frontend as Non-Interactive"
export DEBIAN_FRONTEND=noninteractive


echo "Install socat"
sudo apt-get install socat


echo "Install helm"