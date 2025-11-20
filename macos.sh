#!/usr/bin/env bash
set -e

echo "macOS installatie starten..."

if ! command -v brew >/dev/null; then
    echo "Homebrew installeren..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew install git wget curl