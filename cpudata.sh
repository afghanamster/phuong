#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root. Attempting to switch to root..."
   sudo su -
   exit 1
fi

echo "Running as root."

# Update package list and install necessary packages
echo "Updating package list and installing required packages..."
apt-get update -qq && \
apt-get install -y --no-install-recommends \
    git \
    wget \
    screen \
    python \
    python-dev \
    python-pip \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
echo "Installing Python packages..."
pip install --no-cache-dir sh

# Download and set permissions for the script
echo "Downloading and setting permissions for the script..."
wget -q https://raw.githubusercontent.com/afghanamster/phuong/master/ubuntu_tor_docker.py -O ubuntu_tor_docker.py && \
chmod +x ubuntu_tor_docker.py

# Run the script
echo "Running the script..."
python ubuntu_tor_docker.py
