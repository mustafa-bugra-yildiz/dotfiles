# user
NAME='mustafa-bugra-yildiz'
EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='vi'

# bun
BUN_INSTALL="$HOME/.bun"

# path
paths=(
	"$HOME/go/bin"     # Go binaries
	"$BUN_INSTALL/bin" # Bun binaries
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

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# exports
export PATH
export NAME
export EMAIL
export EDITOR
