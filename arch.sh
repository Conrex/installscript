#!/usr/bin/env bash
set -e

echo "Arch installatie starten..."

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git wget curl yay