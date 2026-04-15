# Run all setup scripts
setup: prereqs runtimes llm-engines agents
    @echo "All setup scripts executed."

# Run health check
health:
    @echo "Running health check..."
    @./scripts/health-check.sh

# Build and run Docker image to benchmark total size
bench:
    @echo "Building Docker image for benchmarking..."
    docker build -t agentic-vm-bench .
    @echo "Total size of installation in Docker:"
    docker run --rm agentic-vm-bench du -sh /

# Run system prerequisites
prereqs:
    @echo "Running 01-prereqs.sh..."
    -@./scripts/01-prereqs.sh > /dev/null 2>&1 || true

# Run runtimes setup
runtimes:
    @echo "Running 02-runtimes.sh..."
    -@./scripts/02-runtimes.sh > /dev/null 2>&1 || true

# Run LLM engines setup
llm-engines:
    @echo "Running 03-llm-engines.sh..."
    -@./scripts/03-llm-engines.sh > /dev/null 2>&1 || true

# Run AI agents setup
agents:
    @echo "Running 04-agents.sh..."
    -@./scripts/04-agents.sh > /dev/null 2>&1 || true
