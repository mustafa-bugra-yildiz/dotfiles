export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
plugins=(git)
source $ZSH/oh-my-zsh.sh

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

RUST_TOOLING=$(dirname $(rustup which cargo))
export PATH="$PATH:$RUST_TOOLING"

export PATH="$PATH:$HOME/.bin"

export EDITOR="hx"
