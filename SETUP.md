# Debian VM AI Tools Setup Guide

This guide details the prerequisites and installation steps for setting up a Debian VM to run OpenClaw, NanoClaw, Hermes Agents, Paperclip, Ollama, and LM Studio.

## 1. System Prerequisites (Native `apt` Installs)

These packages are required for the installation scripts and build processes of the main tools.

| Package | Purpose |
| :--- | :--- |
| `curl` | Downloading installation scripts |
| `git` | Cloning repositories |
| `make` | Orchestrating setup via Makefile |
| `just` | Orchestrating setup via justfile |
| `build-essential` | Compiling native modules (gcc, make) |
| `python3`, `python3-venv` | Python environment for agents |
| `docker.io` | Container runtime for NanoClaw |
| `ffmpeg` | Audio processing for Hermes Agents |
| `ripgrep` | Fast file searching for Hermes Agents |
| `ca-certificates`, `gnupg` | Secure package management |

### Installation Command
```bash
sudo apt update && sudo apt install -y \
  curl \
  git \
  make \
  just \
  build-essential \
  python3 \
  python3-venv \
  docker.io \
  ffmpeg \
  ripgrep \
  ca-certificates \
  gnupg
```

## 2. Core Runtimes (Script/Manager Installs)

Most AI tools require specific versions of Node.js and package managers.

### Node.js (Version 22.x Recommended)
Required by OpenClaw, NanoClaw, and Paperclip.
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

### pnpm
Required by Paperclip.
```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

## 3. Tool Installation Matrix

| Tool | Installation Method | Command/Script |
| :--- | :--- | :--- |
| **Ollama** | Bash Script | `curl -fsSL https://ollama.com/install.sh | sh` |
| **LM Studio (LMS)** | Bash Script | `curl -fsSL https://lmstudio.ai/install.sh | bash` |
| **Claude Code CLI** | Bash Script | `curl -fsSL https://claude.ai/install.sh | bash` |
| **OpenClaw** | Bash Script | `curl -fsSL https://openclaw.ai/install.sh | bash` |
| **Hermes Agents** | Bash Script | `curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash` |
| **Paperclip** | npx / onboard | `npx paperclipai onboard --yes` |
| **NanoClaw** | Git + Manual | *See below* |

### Automation with Make or Just
You can orchestrate the entire setup using either `make` or `just`.

#### Using Make:
```bash
make setup
```

#### Using Just:
```bash
just setup
```

These commands will run all setup scripts in order, suppressing output and ignoring minor non-critical failures.

### NanoClaw Setup
NanoClaw requires a manual clone and build process after Claude Code is authenticated.
```bash
git clone https://github.com/andrewsiah/nanoclaw-pro.git
cd nanoclaw-pro
npm install
npm run build
./container/build.sh
```

## 4. Hardware Considerations
- **RAM**: Minimum 16GB recommended (Ollama and LM Studio consume significant memory).
- **GPU**: NVIDIA GPU with `nvidia-container-toolkit` is highly recommended for Ollama/LM Studio performance.
- **Storage**: 100GB+ for model weights.

## 5. Summary of Scripts
1. `01-prereqs.sh`: Install apt packages, Docker, Make, and Just.
2. `02-runtimes.sh`: Install Node.js, pnpm, and Claude Code.
3. `03-llm-engines.sh`: Install Ollama and LM Studio.
4. `04-agents.sh`: Install OpenClaw, Hermes, Paperclip, and NanoClaw.