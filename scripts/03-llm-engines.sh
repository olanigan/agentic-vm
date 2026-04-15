#!/bin/bash
# Script 03: Install LLM Engines (Ollama)
set -e

echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Verifying Ollama installation..."
ollama --version

echo "LLM Engines installed successfully."
echo "Wait for 01-prereqs.sh group changes to take effect if using GPUs."
echo "To run Ollama: 'ollama serve'"