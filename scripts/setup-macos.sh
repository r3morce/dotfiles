#!/bin/bash

# macOS Setup Script for dotfiles-universal
# This script installs all prerequisites and sets up the development environment

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print status
print_status() {
  if [ $1 -eq 0 ]; then
    echo -e "${GREEN}✅ $2${NC}"
  else
    echo -e "${RED}❌ $2${NC}"
    return 1
  fi
}

print_info() {
  echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
  echo -e "${YELLOW}⚠️  $1${NC}"
}

echo -e "${BLUE}🍎 Setting up macOS development environment...${NC}"

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo -e "${RED}❌ This script is for macOS only${NC}"
  exit 1
fi

# Check if Homebrew is installed
print_info "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
  print_info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ $(uname -m) == "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  print_status 0 "Homebrew is already installed"
fi

# Update Homebrew
print_info "Updating Homebrew..."
brew update

# Install core tools
print_info "Installing core development tools..."
brew install neovim wezterm zoxide eza fd stow

# Install Zsh plugins
print_info "Installing Zsh plugins..."
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete powerlevel10k

# Install additional useful tools
print_info "Installing additional tools..."
brew install lazygit ripgrep exa htop tldr fd neofetch

print_status 0 "macOS setup complete!"
echo -e "${GREEN}🎉 Your macOS development environment is ready!${NC}"
echo ""
echo "Next steps:"
echo "1. Run 'stow .' to install your dotfiles"
echo "2. Restart your terminal"
echo "3. Run 'p10k configure' to customize your prompt"