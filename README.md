# Python Project Template

This repository serves as a template for creating Python projects. The project leverages tools like `Just`, `uv`, `pre-commit`, `Ruff`, and `pytest` to enhance developer productivity and code quality.

---

## Features

- **Dependency Management**: Simplified using `uv`.
- **Code Quality**: Enforced through `Ruff` (linter and formatter).
- **Pre-Commit Hooks**: Configured to catch issues before commits.
- **Testing and Coverage**: Automated with `pytest` and `pytest-cov`.
- **Git Commit Standardization**: Ensures conventional commit messages using `Commitizen`.
- **Environment Setup**: Streamlined via `Brewfile` and `Just`.

---

## Getting Started

### Prerequisites

1. Install [Homebrew](https://brew.sh/) if not already installed.
2. Install `Just`:
   ```bash
   brew install just
    ```

### Setup Local Environment

Run the following command to set up your local development environment:
   ```bash
    just setup
    ```

## Common Commands

Below are the key commands available in the `Justfile`. Run `just help` to see the complete list.

### Setup and Installation

- `just setup`: Sets up the local development environment.
- `just install`: Installs project dependencies.

### Code Quality

- `just lint`: Lints the code using `Ruff`.
- `just format`: Auto-formats the code using `Ruff`.
- `just pre-commit`: Runs all pre-commit checks.

### Testing and Coverage

- `just test`: Runs tests with `pytest` and checks coverage.
- `just coverage`: Generates a coverage report in XML format.

### Workflow and Utilities

- `just commit`: Creates a new commit following Conventional Commits using `Commitizen`.
- `just clean`: Cleans up build, test artifacts, and logs.
- `just help`: Displays the list of available commands.
