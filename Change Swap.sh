#!/bin/bash

swapon --show
read -p "New Swap File Size (ex.: 4G): " change


sudo swapoff /swapfile                      # Turn swap off
sudo fallocate -l $change /swapfile         # Make the change
sudo mkswap /swapfile                       # Confirmation
sudo swapon /swapfile                       # Turn swap back on

swapon --show
read -p "" ok