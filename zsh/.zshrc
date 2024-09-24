# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases
