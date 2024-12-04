export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
plugins=(git)
source $ZSH/oh-my-zsh.sh

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
