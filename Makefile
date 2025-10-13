# dotfiles-universal Makefile
# Provides convenient commands for managing the dotfiles

.PHONY: help install validate setup-macos setup-linux clean

# Default target
help:
	@echo "dotfiles-universal - Universal cross-platform dotfiles"
	@echo ""
	@echo "Available commands:"
	@echo "  make install        - Install dotfiles using stow"
	@echo "  make validate       - Validate configuration files"
	@echo "  make setup-macos    - Setup macOS environment"
	@echo "  make setup-linux    - Setup Linux environment"
	@echo "  make clean          - Remove installed dotfiles"
	@echo "  make help           - Show this help message"

# Install dotfiles
install:
	@echo "Installing dotfiles..."
	stow .

# Validate configuration
validate:
	@echo "Validating configuration..."
	./scripts/validate.sh

# Setup macOS environment
setup-macos:
	@echo "Setting up macOS environment..."
	./scripts/setup-macos.sh

# Setup Linux environment
setup-linux:
	@echo "Setting up Linux environment..."
	./scripts/setup-linux.sh

# Remove installed dotfiles
clean:
	@echo "Removing installed dotfiles..."
	stow -D .

# Restow (useful after updates)
restow:
	@echo "Restowing dotfiles..."
	stow -R .