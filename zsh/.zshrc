# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export USER="sodabyte"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases
eval "$(starship init zsh)"
