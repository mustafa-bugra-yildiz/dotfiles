USER_NAME='mustafa-bugra-yildiz'
USER_EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='nvim'

# aliases
alias vi="$EDITOR"
alias g="git"
alias gst="git status"
alias gau="git add -u"
alias gds="git diff --staged"

# package manager
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# fuzzy finder
command -v fzf >/dev/null && source <(fzf --zsh)

# go packages
PATH="$PATH:$HOME/go/bin"

# rust packages
PATH="/opt/homebrew/opt/rustup/bin:$PATH"

# env
export PATH
export USER_NAME
export USER_EMAIL
export EDITOR
