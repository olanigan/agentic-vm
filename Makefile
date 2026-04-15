.PHONY: all setup prereqs runtimes llm-engines agents health

all: setup

setup: prereqs runtimes llm-engines agents
	@echo "All setup scripts executed."

health:
	@echo "Running health check..."
	@./scripts/health-check.sh

bench:
	@echo "Building Docker image for benchmarking..."
	docker build -t agentic-vm-bench .
	@echo "Total size of installation in Docker:"
	docker run --rm agentic-vm-bench du -sh /

prereqs:
	@echo "Running 01-prereqs.sh..."
	@-./scripts/01-prereqs.sh > /dev/null 2>&1 || true

runtimes:
	@echo "Running 02-runtimes.sh..."
	@-./scripts/02-runtimes.sh > /dev/null 2>&1 || true

llm-engines:
	@echo "Running 03-llm-engines.sh..."
	@-./scripts/03-llm-engines.sh > /dev/null 2>&1 || true

agents:
	@echo "Running 04-agents.sh..."
	@-./scripts/04-agents.sh > /dev/null 2>&1 || true
