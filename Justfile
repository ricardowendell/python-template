project_name := "python_template"

# Setup local development environemtn
setup:
    @echo "==> Installing system dependencies via Brewfile..."
    brew bundle --file=Brewfile --no-lock

    @echo "==> Syncing environment with uv..."
    uv sync

    @echo "==> Installing pre-commit hooks..."
    pre-commit install

    @echo "==> Setup complete."

# Install dependencies
install:
    uv sync
    @echo "==> Installed project dependencies."

# Run linter using Ruff
lint:
    @echo "==> Linting code with ruff..."
    uv run ruff check .

# Format code using Ruff
format:
    @echo "==> Auto-formatting code with ruff..."
    uv run ruff check . --fix

# Run automated tests
test:
    @echo "==> Running tests with pytest + coverage..."
    uv run pytest --cov=src/python_template --cov-report=term-missing --cov-fail-under=80

# Generate coverage report
coverage:
    @echo "==> Generating coverage XML report..."
    uv run pytest --cov=src/python_template --cov-report=xml --cov-report=term-missing

# Run pre-commit checks
pre-commit:
    uv run pre-commit run --all-files

# Clean build/test artifacts
clean:
    @echo "==> Cleaning build/test artifacts..."
    rm -rf .pytest_cache .ruff_cache .venv logs __pycache__ .coverage coverage.xml dist build
    @echo "==> Clean complete."

# Display list of commands
help:
    @just --list
