#!/bin/bash
# Main Setup Script for Debian AI VM
set -e

# Make all scripts executable
chmod +x scripts/*.sh

echo "Starting full installation for Debian AI VM..."
echo "This process will require sudo privileges."

# 1. Prereqs
./scripts/01-prereqs.sh

# 2. Runtimes (Requires sudo for Node.js)
./scripts/02-runtimes.sh

# 3. LLM Engines
./scripts/03-llm-engines.sh

# 4. AI Agents (Wait for sudo if needed)
./scripts/04-agents.sh

echo "=========================================================="
echo "Installation complete!"
echo "Please follow these post-installation steps:"
echo "1. Restart your terminal (or run 'source ~/.bashrc') to update your PATH."
echo "2. Run 'claude' to authenticate your Claude Code CLI."
echo "3. Run 'ollama serve' and 'lms daemon up' in separate terminals/tmux sessions."
echo "4. Follow the specific onboarding steps for OpenClaw, Hermes, and NanoClaw as detailed in SETUP.md."
echo "=========================================================="
