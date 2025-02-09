# user
NAME='mustafa-bugra-yildiz'
EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='nvim'

# editor
if [ "$EDITOR" != vi ]; then
	alias vi="$EDITOR"
fi

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

# fnm
command -v fnm >/dev/null && eval "$(fnm env)"

# exports
export PATH
export NAME
export EMAIL
export EDITOR
