# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# PLATFORM DETECTION
# ============================================================================
# Detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PLATFORM="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PLATFORM="linux"
else
    export PLATFORM="unknown"
fi

# ============================================================================
# HISTORY CONFIGURATION
# ============================================================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ============================================================================
# PATH CONFIGURATION
# ============================================================================
# Platform-specific PATH additions
if [[ "$PLATFORM" == "macos" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
elif [[ "$PLATFORM" == "linux" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# ============================================================================
# EDITOR CONFIGURATION
# ============================================================================
export EDITOR='nvim'
export VISUAL='nvim'
alias vim='nvim'
alias v='nvim'

# Platform-specific browser
if [[ "$PLATFORM" == "macos" ]]; then
    export BROWSER=open
fi

# ============================================================================
# ZSH PLUGINS AND THEMES
# ============================================================================
# Load Powerlevel10k theme directly (no Oh My Zsh)
if [[ "$PLATFORM" == "macos" ]]; then
    source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif [[ "$PLATFORM" == "linux" ]]; then
    source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# Load Zsh plugins
if [[ "$PLATFORM" == "macos" ]]; then
    # zsh-autosuggestions
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # zsh-syntax-highlighting
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # zsh-autocomplete
    source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
elif [[ "$PLATFORM" == "linux" ]]; then
    # zsh-autosuggestions
    [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # zsh-syntax-highlighting
    [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # zsh-autocomplete
    [[ -f ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

# Plugin configurations
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan,bold'

# ============================================================================
# ALIASES
# ============================================================================
# Universal aliases
alias lg='lazygit'
alias gs="git status"
alias fd='fd -I'

# Platform-specific aliases
if [[ "$PLATFORM" == "macos" ]]; then
    alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
    alias ca="cursor-agent text"
fi

# Universal navigation aliases
alias p='cd ~/Documents/projects/'
alias s='cd ~/Documents/sandbox/'

# WezTerm aliases (universal)
alias nt='wezterm cli set-tab-title'
alias sl='wezterm cli split-pane --left'
alias sb='wezterm cli split-pane --bottom'

# File listing aliases (universal)
alias ls="eza --icons=always"
alias ll="eza --icons=always -l"
alias la="eza --icons=always -la"



# ============================================================================
# TOOL INITIALIZATION
# ============================================================================
# Initialize zoxide (smarter cd)
eval "$(zoxide init zsh)"

# Better completion
autoload -U compinit && compinit


# ============================================================================
# POWERLEVEL10K CONFIGURATION
# ============================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh