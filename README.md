# dotfiles-universal

A universal, cross-platform development environment configuration that works on both macOS and Linux (Pop!_OS/Ubuntu).

## Features

- 🖥️ **Cross-platform**: Works on macOS and Linux
- 🚀 **Fast setup**: Automated installation scripts
- 🎨 **Beautiful UI**: Dracula theme with Powerlevel10k
- ⚡ **Performance**: Optimized for speed and efficiency
- 🔧 **Modular**: Install only what you need

## Quick Start

### macOS
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/dotfiles-universal/main/scripts/install-macos.sh | bash
```

### Linux (Pop!_OS/Ubuntu)
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/dotfiles-universal/main/scripts/install-linux.sh | bash
```

## Manual Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/r3morce/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run platform-specific setup:**
   ```bash
   # For macOS
   make setup-macos
   
   # For Linux
   make setup-linux
   ```

3. **Install dotfiles:**
   ```bash
   make install
   ```

## Available Commands

Use the Makefile for convenient management:

```bash
make help           # Show available commands
make install        # Install dotfiles using stow
make validate       # Validate configuration files
make setup-macos    # Setup macOS environment
make setup-linux    # Setup Linux environment
make clean          # Remove installed dotfiles
make restow         # Restow dotfiles (useful after updates)
```

## What's Included

- **Zsh**: Enhanced shell with Oh My Zsh and Powerlevel10k
- **Neovim**: Modern editor with LazyVim configuration
- **WezTerm**: Cross-platform terminal emulator
- **Powerlevel10k**: Beautiful and fast Zsh theme

## Platform Detection

The configuration automatically detects your platform and applies the appropriate settings:

- **macOS**: Uses Homebrew paths, macOS-specific aliases
- **Linux**: Uses apt/package manager paths, Linux-specific aliases

## Customization

After installation, you can customize your setup:

- Run `p10k configure` to customize your prompt
- Edit `~/.zshrc` for shell customizations
- Modify WezTerm settings in `~/.config/wezterm/wezterm.lua`

## License

MIT License - see [LICENSE](LICENSE) file for details.