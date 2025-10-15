if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

 plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
 )

source $ZSH/oh-my-zsh.sh

# EDITOR CONFIGURATION
export EDITOR='nvim'
export VISUAL='nvim'
alias v='nvim'

# HISTORY CONFIGURATION
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# EDITOR CONFIGURATION
export EDITOR='nvim'
export VISUAL='nvim'
alias v='nvim'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
