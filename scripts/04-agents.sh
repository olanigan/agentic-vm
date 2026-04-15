#!/bin/bash
# Script 04: Install AI Agents (OpenClaw, Hermes, Paperclip, NanoClaw)
set -e

# Make sure path is updated for current session
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

echo "Installing OpenClaw..."
curl -fsSL https://openclaw.ai/install.sh | bash
# Backup npm global install if needed
# sudo npm install -g openclaw@latest

echo "Installing Hermes Agent..."
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

echo "Installing Paperclip AI..."
npx paperclipai onboard --yes

echo "Installing NanoClaw..."
# Requires Claude Code to be authenticated first
git clone https://github.com/andrewsiah/nanoclaw-pro.git "$HOME/nanoclaw-pro"
cd "$HOME/nanoclaw-pro"
npm install
npm run build
# Build the agent container image (requires docker)
./container/build.sh

echo "AI Agents installed successfully."
echo "Notes:"
echo "- To start OpenClaw onboarding: 'openclaw onboard --install-daemon'"
echo "- To start Hermes Agent: 'hermes setup' or 'hermes'"
echo "- To start Paperclip: 'npx paperclipai start'"
echo "- To start NanoClaw: run 'claude' in the nanoclaw-pro directory and use /setup"
