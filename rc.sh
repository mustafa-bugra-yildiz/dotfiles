# User configuration
USER_NAME='mustafa-bugra-yildiz'
USER_EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='nvim'

# Basic aliases
alias vi="$EDITOR"

# Git aliases
alias g="git"
alias gst="git status"
alias gau="git add -u"
alias gds="git diff --staged"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"

# PATH management
PATH_DIRS=(
	"$HOME/go/bin"                 # Go packages
	"/opt/homebrew/opt/rustup/bin" # Rust packages
)

for dir in "${PATH_DIRS[@]}"; do
	if [ -d "$dir" ]; then
		PATH="$PATH:$dir"
	fi
done

# Homebrew setup
if [ -f /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "Warning: Homebrew not found"
fi

# Fuzzy finder setup
if command -v fzf >/dev/null; then
	source <(fzf --zsh)
else
	echo "Warning: fzf not found"
fi

# NVM (Node Version Manager) setup
NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
	source "/opt/homebrew/opt/nvm/nvm.sh"
	source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
else
	echo "Warning: NVM not found"
fi

# Exports
export PATH
export USER_NAME
export USER_EMAIL
export EDITOR
export NVM_DIR
