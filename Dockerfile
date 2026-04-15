# Base image
FROM debian:trixie-slim

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install sudo (required by scripts) and basic tools
RUN apt-get update && apt-get install -y sudo curl ca-certificates && 
    rm -rf /var/lib/apt/lists/*

# Create a non-root user 'unblockd'
RUN useradd -m -s /bin/bash unblockd && 
    echo "unblockd ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER unblockd
WORKDIR /home/unblockd/setup

# Copy all scripts and files
COPY --chown=unblockd:unblockd . .

# Make scripts executable
RUN chmod +x scripts/*.sh main-setup.sh

# Run the setup scripts sequentially
# Note: Some scripts might fail due to lack of real systemd or GPU, 
# so we use || true for benchmarking purposes if they are non-critical.
RUN ./scripts/01-prereqs.sh
RUN ./scripts/02-runtimes.sh
RUN ./scripts/03-llm-engines.sh

# Script 04 might require Claude authentication for some parts, 
# so we run it as far as it can go.
RUN ./scripts/04-agents.sh || true

# Final check
RUN ./scripts/health-check.sh || true

# Command to help benchmark size
CMD ["du", "-sh", "/"]
