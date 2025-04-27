# user
EMAIL='mustafa.bugra.yildiz@icloud.com'
NAME='mustafa-bugra-yildiz'

# editor
EDITOR='nvim'
if test "$EDITOR" != vi; then
  alias vi="$EDITOR"
fi

# omz
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" # set by `omz`
plugins=(git)
source $ZSH/oh-my-zsh.sh

# functions
work() {
  pick() {
    fd -H --type d .git ~/Desktop | # Every directory in ~/Desktop
    grep '.git/$'                 | # Filter the ones with git repos
    grep -v 'node_modules'        | # Remove node_modules -_-
    sed 's/\/.git\/$//'           | # Truncate '/.git$' suffix
    sed 's/.*Desktop\///'         | # Truncate '.*/Desktop/' prefix
    fzf --preview='cat ~/Desktop/{}/README.md' \
        --preview-window=down
  }

  p=$(pick)
  test "$p" != "" && cd ~/Desktop/$p && $EDITOR
}

# aliases
alias ls='ls --color=auto'
unalias 9

# path
paths=(
  "$HOME/.bin"                   # custom binaries
  "$HOME/go/bin"                 # Go binaries
  "/opt/homebrew/opt/rustup/bin" # Rust binaries
)

for dir in "${paths[@]}"; do
  [ -d "$dir" ] && PATH="$PATH:$dir"
done

PATH="/opt/homebrew/opt/rsync/bin:$PATH"

# homebrew
[ -f /opt/homebrew/bin/brew ] && {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

# exports
export EMAIL
export NAME
export PATH
export ZSH
