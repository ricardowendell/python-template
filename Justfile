project_name := "python_template"


alias c := commit
alias t := test

# Default command (runs all code checks)
default : pre-commit

# Setup local development environment
setup:
    @echo "==> Syncing environment with uv..."
    uv sync

    @echo "==> Installing pre-commit hooks..."
    pre-commit install

    @echo "==> Setup complete."

# Create a new commit following Conventional Commits
commit:
    @echo "==> Creating a new commit with Commitizen..."
    uv run cz commit

# Install dependencies
install:
    uv sync
    @echo "==> Installed project dependencies."

# Run linter using Ruff
lint:
    @echo "==> Linting code with Ruff..."
    uv run ruff check .

# Format code using Ruff
format:
    @echo "==> Auto-formatting code with Ruff..."
    uv run ruff check . --fix

# Run automated tests
test:
    @echo "==> Running tests with pytest + coverage..."
    uv run pytest --cov=src/{{project_name}} --cov-report=term-missing --cov-fail-under=80

# Generate coverage report
coverage:
    @echo "==> Generating coverage XML report..."
    uv run pytest --cov=src/{{project_name}} --cov-report=xml --cov-report=term-missing

# Run pre-commit checks
pre-commit:
    @echo "==> Running all code checks with pre-commit..."
    uv run pre-commit run --all-files

# Clean build/test artifacts
clean:
    @echo "==> Cleaning build/test artifacts..."
    rm -rf .pytest_cache .ruff_cache .venv logs __pycache__ .coverage coverage.xml dist build
    @echo "==> Clean complete."

# Display list of commands
help:
    @echo "==> Available commands:"
    @just --list
