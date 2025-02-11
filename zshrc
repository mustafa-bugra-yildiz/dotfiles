# user
NAME='mustafa-bugra-yildiz'
EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='vi'

# aliases
alias dots='cat ~/personal/dotfiles/README.md | npx codedown sh'
if [ "$EDITOR" != vi ]; then
  alias vi="$EDITOR"
fi
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

# prompt
PS1='%~: '

# fuzzy finder
command -v fzf >/dev/null && source <(fzf --zsh)

# fnm
command -v fnm >/dev/null && eval "$(fnm env)"

# exports
export PATH
export NAME
export EMAIL
export EDITOR
