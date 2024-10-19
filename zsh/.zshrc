# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

# fzf key bindings and fuzzy completion
source <(fzf --zsh)

# completion styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

export EDITOR=nvim
export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"
