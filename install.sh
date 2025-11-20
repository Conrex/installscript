#!/usr/bin/env bash
set -e

OS="$(uname -s)"

if [[ "$OS" == "Linux" ]]; then
    if [[ -f "/etc/arch-release" ]]; then
        echo "Arch Linux gedetecteerd"
        source "$(dirname "$0")/arch.sh"
    else
        echo "Geen Arch Linux. Script stopt."
        exit 1
    fi
elif [[ "$OS" == "Darwin" ]]; then
    echo "macOS gedetecteerd"
    source "$(dirname "$0")/macos.sh"
else
    echo "Onbekend OS: $OS"
    exit 1
fi

echo "Installatie voltooid!"