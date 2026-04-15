#!/bin/bash
# Script 01: Install System Prerequisites
set -e

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing essential build tools and utilities..."
sudo apt install -y \
    curl \
    git \
    make \
    just \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    docker.io \
    ffmpeg \
    ripgrep \
    ca-certificates \
    gnupg \
    unzip \
    wget

echo "Configuring Docker permissions..."
sudo usermod -aG docker $USER
echo "Docker installed. You may need to logout/login or run 'newgrp docker' for group changes."

echo "Prerequisites installed successfully."
