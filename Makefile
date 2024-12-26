## Common tasks
.PHONY: install
install:
	uv sync

## Development setup
.PHONY: setup
setup: install-uv install-pre-commit install

.PHONY: install-uv
install-uv:  ## Install dependency manager
	@echo "Installing uv..."
	brew install uv

.PHONY: install-pre-commit
install-pre-commit: ## Install pre-commit hooks
	@echo "Installing pre-commit hooks..."
	pre-commit install