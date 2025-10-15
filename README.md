# dotfiles-universal

A universal, cross-platform development environment configuration that works on both macOS and Linux (Pop!_OS/Ubuntu).

## Features

- 🖥️ **Cross-platform**: Works on macOS and Linux
- 🚀 **Fast setup**: Automated installation scripts
- 🎨 **Beautiful UI**: Dracula theme with Powerlevel10k
- ⚡ **Performance**: Optimized for speed and efficiency
- 🔧 **Modular**: Install only what you need

## Quick Start

### One-Command Installation
```bash
# Clone and install everything
git clone https://github.com/r3morce/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

### Manual Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/r3morce/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installer:**
   ```bash
   ./install.sh
   ```

   Or use the Makefile:
   ```bash
   # For macOS
   make setup-macos && make install
   
   # For Linux
   make setup-linux && make install
   ```

## Platform Detection

The configuration automatically detects your platform and applies the appropriate settings:

- **macOS**: Uses Homebrew paths, macOS-specific aliases
- **Linux**: Uses apt/package manager paths, Linux-specific aliases

## Customization

After installation, you can customize your setup:

- Run `p10k configure` to customize your prompt
- Edit `~/.zshrc` for shell customizations
- Modify WezTerm settings in `~/.config/wezterm/wezterm.lua`
- Add more Oh My Zsh plugins by editing the `plugins=()` array in `~/.zshrc`
