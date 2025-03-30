# user
EMAIL='mustafa.bugra.yildiz@icloud.com'
NAME='mustafa-bugra-yildiz'

# omz
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" # set by `omz`
plugins=(git)
source $ZSH/oh-my-zsh.sh

# functions
work() {
  pick() {
    find ~/Desktop -type d | # Every directory in ~/Desktop
    grep '.git$'           | # Filter the ones with git repos
    grep -v 'node_modules' | # Remove node_modules -_-
    sed 's/\/.git$//'      | # Truncate '/.git$' suffix
    sed 's/.*Desktop\///'  | # Truncate '.*/Desktop/' prefix
    fzf --preview='bat --theme auto:system --color always --style=plain ~/Desktop/{}/README.md' \
        --preview-window=down
  }

  p=$(pick)
  test "$p" != "" && cd ~/Desktop/$p && nvim
}

# aliases
alias ls='ls --color=auto'

# path
paths=(
  "$HOME/.bin"                   # custom binaries
  "$HOME/go/bin"                 # Go binaries
  "/opt/homebrew/opt/rustup/bin" # Rust binaries
)

for dir in "${paths[@]}"; do
  [ -d "$dir" ] && PATH="$PATH:$dir"
done

# homebrew
[ -f /opt/homebrew/bin/brew ] && {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

# fnm
command -v fnm >/dev/null && {
  eval "$(fnm env)"
}

# exports
export EMAIL
export NAME
export PATH
export ZSH
