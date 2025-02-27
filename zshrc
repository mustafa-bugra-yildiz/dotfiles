# user
NAME='mustafa-bugra-yildiz'
EMAIL='mustafa.bugra.yildiz@icloud.com'

# aliases
alias ls='ls --color=auto'

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

# fnm
command -v fnm >/dev/null && eval "$(fnm env)"

# exports
export PATH
export NAME
export EMAIL