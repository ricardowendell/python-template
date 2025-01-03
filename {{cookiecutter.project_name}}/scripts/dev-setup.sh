#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error
set -o pipefail  # Return the exit code of the first failed command in a pipeline

echo "==> Starting development environment setup..."

# Check for Jetfy's Devbox
if ! command -v devbox &> /dev/null; then
    echo "==> Installing Jetfy's Devbox..."
    curl -fsSL https://get.jetpack.io/devbox | bash
else
    echo "==> Devbox is already installed."
fi

# Initialize or update Devbox configuration
if [ ! -f "devbox.json" ]; then
    echo "==> Creating devbox.json configuration..."
    cat <<EOF > devbox.json
{
  "packages": ["python@3.12", "just@latest", "pre-commit", "act"],
  "shell": {
    "init_hook": [
      "pip install --upgrade pip",
      "pip install uv",
      "just setup"
    ]
  }
}
EOF
else
    echo "==> devbox.json already exists. Skipping initialization."
fi

echo "==> Activating Devbox environment..."
source devbox shell

echo "==> Development environment setup complete."
