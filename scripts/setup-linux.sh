#!/bin/bash

# Linux Setup Script for dotfiles-universal
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

echo -e "${BLUE}🐧 Setting up Linux development environment...${NC}"

# Check if we're on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  echo -e "${RED}❌ This script is for Linux only${NC}"
  exit 1
fi

# Update package list
print_info "Updating package list..."
sudo apt update

# Install core tools
print_info "Installing core development tools..."
sudo apt install -y neovim zsh stow fd-find curl wget git

# Install eza (modern ls replacement)
print_info "Installing eza..."
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/geza-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/geza-archive-keyring.gpg] http://deb.geza.io stable main" | sudo tee /etc/apt/sources.list.d/geza.list
sudo chmod 644 /etc/apt/keyrings/geza-archive-keyring.gpg /etc/apt/sources.list.d/geza.list
sudo apt update && sudo apt install -y eza

# Install zoxide (smarter cd)
print_info "Installing zoxide..."
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Install WezTerm
print_info "Installing WezTerm..."
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install -y wezterm

# Install Oh My Zsh
print_info "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  print_status 0 "Oh My Zsh installed"
else
  print_status 0 "Oh My Zsh is already installed"
fi

# Install Zsh plugins
print_info "Installing Zsh plugins..."
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Install additional useful tools
print_info "Installing additional tools..."
sudo apt install -y lazygit ripgrep htop tldr neofetch

# Install exa (modern ls replacement)
print_info "Installing exa..."
sudo apt install -y exa

# fd is already installed as fd-find, create symlink
print_info "Setting up fd symlink..."
sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd


print_status 0 "Linux setup complete!"
echo -e "${GREEN}🎉 Your Linux development environment is ready!${NC}"
echo ""
echo "Next steps:"
echo "1. Run 'stow .' to install your dotfiles"
echo "2. Restart your terminal"
echo "3. Run 'p10k configure' to customize your prompt"
echo "4. Source your .zshrc: 'source ~/.zshrc'"