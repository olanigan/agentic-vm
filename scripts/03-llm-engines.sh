#!/bin/bash
# Script 03: Install LLM Engines (Ollama and LM Studio)
set -e

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Verifying Ollama installation..."
ollama --version

echo "Installing LM Studio (LMS CLI and Daemon)..."
# This downloads and installs the 'lms' CLI tool and its daemon
curl -fsSL https://lmstudio.ai/install.sh | bash

echo "LLM Engines installed successfully."
echo "Wait for 01-prereqs.sh group changes to take effect if using GPUs."
echo "To run Ollama: 'ollama serve'"
echo "To run LM Studio Daemon: 'lms daemon up'"
echo "To run LM Studio Server: 'lms server start'"
