#!/bin/bash
# Health check for AI VM tools
echo "Starting Health Check..."
echo "========================="

check_cmd() {
    if command -v $1 >/dev/null 2>&1; then
        echo "✅ $1: Installed ($($1 --version 2>&1 | head -n 1))"
        return 0
    else
        echo "❌ $1: Not Found"
        return 1
    fi
}

# 1. Runtimes
echo "--- Runtimes ---"
check_cmd node
check_cmd npm
check_cmd pnpm
check_cmd python3

# 2. Engines
echo "--- Engines ---"
check_cmd docker
if command -v ollama >/dev/null 2>&1; then
    if curl -s http://localhost:11434/api/tags >/dev/null; then
        echo "✅ Ollama: Running"
    else
        echo "⚠️  Ollama: Service not responding (is it running?)"
    fi
fi

check_cmd lms

# 3. Agents
echo "--- Agents ---"
check_cmd claude
check_cmd openclaw
check_cmd hermes

echo "========================="
echo "Health check complete."
