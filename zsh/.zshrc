# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PLATFORM DETECTION
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PLATFORM="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PLATFORM="linux"
else
    export PLATFORM="unknown"
fi

# HISTORY CONFIGURATION
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# PATH CONFIGURATION
if [[ "$PLATFORM" == "macos" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
elif [[ "$PLATFORM" == "linux" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# EDITOR CONFIGURATION
export EDITOR='nvim'
export VISUAL='nvim'
alias v='nvim'

# Browser
if [[ "$PLATFORM" == "macos" ]]; then
    export BROWSER=open
fi

# THEMES & PLUGINS
if [[ "$PLATFORM" == "macos" ]]; then
    source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif [[ "$PLATFORM" == "linux" ]]; then
    source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# External plugins
if [[ "$PLATFORM" == "macos" ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
elif [[ "$PLATFORM" == "linux" ]]; then
    [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [[ -f ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

# Plugin settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan,bold'

# ALIASES
# General aliases
alias lg='lazygit'
alias gs="git status"
alias fd='fd -I'

# Platform-specific aliases
if [[ "$PLATFORM" == "macos" ]]; then
    alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
    alias ca="cursor-agent text"
fi

# Navigation aliases
alias p='cd ~/Documents/projects/'
alias s='cd ~/Documents/sandbox/'

# WezTerm aliases
alias nt='wezterm cli set-tab-title'
alias sl='wezterm cli split-pane --left'
alias sb='wezterm cli split-pane --bottom'

# File listing aliases
alias ls="eza --icons=always"
alias ll="eza --icons=always -l"
alias la="eza --icons=always -la"

# TOOL INITIALIZATION
eval "$(zoxide init zsh)"

# Better completion
autoload -U compinit && compinit

# POWERLEVEL10K CONFIGURATION
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
