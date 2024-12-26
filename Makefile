## Common tasks
.PHONY: install
install:
	uv sync

.PHONY: test
test:
	uv run pytest

lint:
	ruff check .

format:
	ruff check . --fix

pre-commit:
	pre-commit run --all-files

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
