EMAIL='mustafa.bugra.yildiz@icloud.com'
NAME='mustafa-bugra-yildiz'

# editor
EDITOR='vi'
if test "$EDITOR" = nvim; then
  alias vi="$EDITOR"
fi

# omz
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="evan" # set by `omz`
plugins=(git)
source $ZSH/oh-my-zsh.sh

# functions
proj() {
  pick() {
    fd -H --type d .git ~/code | # Every directory in ~/Desktop
    grep '.git/$'              | # Filter the ones with git repos
    grep -v 'node_modules'     | # Remove node_modules -_-
    sed 's/\/.git\/$//'        | # Truncate '/.git$' suffix
    sed 's/.*code\///'      | # Truncate '.*/Desktop/' prefix
    fzf --preview='cat ~/code/{}/README' \
        --preview-window=down
  }

  p=$(pick)
  test "$p" != "" && cd ~/code/$p
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
export EDITOR
export EMAIL
export NAME
export PATH
export ZSH
