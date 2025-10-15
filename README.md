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

## Available Commands

Use the Makefile for convenient management:

```bash
make help           # Show available commands
make install        # Install dotfiles using stow
make setup-macos    # Setup macOS environment
make setup-linux    # Setup Linux environment
make clean          # Remove installed dotfiles
make restow         # Restow dotfiles (useful after updates)
```

## What's Included

- **Zsh**: Enhanced shell with Oh My Zsh and Powerlevel10k
- **Oh My Zsh**: Framework with git aliases, file operations, and history management
- **Neovim**: Modern editor with LazyVim configuration
- **WezTerm**: Cross-platform terminal emulator
- **Powerlevel10k**: Beautiful and fast Zsh theme
- **Zsh Plugins**: Auto-suggestions, syntax highlighting, and autocomplete

## Platform Detection

The configuration automatically detects your platform and applies the appropriate settings:

- **macOS**: Uses Homebrew paths, macOS-specific aliases
- **Linux**: Uses apt/package manager paths, Linux-specific aliases

## Oh My Zsh Features

This configuration includes several useful Oh My Zsh plugins:

- **git**: Git aliases (`gst`, `ga`, `gc`, `gp`, `gl`, `gd`, etc.)
- **extract**: Extract any archive type (`extract file.zip`)
- **copypath**: Copy current directory path to clipboard
- **copyfile**: Copy file contents to clipboard
- **history**: Optimized history configuration

## Customization

After installation, you can customize your setup:

- Run `p10k configure` to customize your prompt
- Edit `~/.zshrc` for shell customizations
- Modify WezTerm settings in `~/.config/wezterm/wezterm.lua`
- Add more Oh My Zsh plugins by editing the `plugins=()` array in `~/.zshrc`

## License

MIT License - see [LICENSE](LICENSE) file for details.
