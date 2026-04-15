#!/bin/bash
# Script 02: Install Node.js, pnpm, and Claude Code CLI
set -e

echo "Installing Node.js 22.x..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

echo "Verifying Node.js and npm..."
node -v
npm -v

echo "Installing pnpm..."
curl -fsSL https://get.pnpm.io/install.sh | sh -
# Add to path for current session
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

echo "Installing Claude Code CLI..."
curl -fsSL https://claude.ai/install.sh | bash

echo "Runtimes installed successfully."
echo "Note: You must restart your terminal or source your profile to use 'pnpm' and 'claude'."
echo "To authenticate Claude Code: run 'claude' after the next script."
