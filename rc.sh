# user
NAME='mustafa-bugra-yildiz'
EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='vi'

# nvm
NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# path
paths=(
	"$HOME/.bin"   # custom binaries
	"$HOME/go/bin" # Go binaries
)

for dir in "${paths[@]}"; do
	[ -d "$dir" ] && PATH="$PATH:$dir"
done

# homebrew
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# prompt
PS1='%1~: '

# fuzzy finder
command -v fzf >/dev/null && source <(fzf --zsh)

# exports
export PATH
export NAME
export EMAIL
export EDITOR
export NVM_DIR
