#!/bin/bash

# Simple dotfiles installer
# Works on both macOS and Linux

set -e

echo "🚀 Installing dotfiles..."

# Detect platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="linux"
else
    echo "❌ Unsupported platform: $OSTYPE"
    exit 1
fi

echo "📱 Detected platform: $PLATFORM"

# Check if we're in the right directory
if [ ! -f "README.md" ] || [ ! -d "scripts" ]; then
    echo "❌ Please run this script from the dotfiles root directory"
    exit 1
fi

# Run platform-specific setup
echo "🔧 Setting up $PLATFORM environment..."
if [ -f "scripts/setup-$PLATFORM.sh" ]; then
    ./scripts/setup-$PLATFORM.sh
else
    echo "❌ Setup script for $PLATFORM not found"
    exit 1
fi

# Install dotfiles using stow
echo "📁 Installing dotfiles..."
stow .

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal"
echo "2. Run 'p10k configure' to customize your prompt"
echo "3. Enjoy your new setup! 🎉"