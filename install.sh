#!/usr/bin/env bash

set -e

# Detecteer OS
OS="$(uname -s)"

install_arch() {
    echo "Arch Linux gedetecteerd"
    sudo pacman -Syu --noconfirm

    # Voorbeeldpakketten
    sudo pacman -S --noconfirm git
}

install_macos() {
    echo "macOS gedetecteerd"

    # Homebrew installeren als het niet bestaat
    if ! command -v brew >/dev/null; then
        echo "Homebrew wordt geïnstalleerd..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew update

    # Voorbeeldpakketten
    brew install git
}

case "$OS" in
    "Linux")
        if [ -f "/etc/arch-release" ]; then
            install_arch
        else
            echo "Dit is Linux, maar geen Arch Linux. Script stopt."
            exit 1
        fi
        ;;
    "Darwin")
        install_macos
        ;;
    *)
        echo "Onbekend OS: $OS"
        exit 1
        ;;
esac

echo "Installatie voltooid!"