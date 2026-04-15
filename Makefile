.PHONY: all setup prereqs runtimes llm-engines agents

all: setup

setup: prereqs runtimes llm-engines agents
	@echo "All setup scripts executed."

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
