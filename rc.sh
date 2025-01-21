# User configuration
USER_NAME='mustafa-bugra-yildiz'
USER_EMAIL='mustafa.bugra.yildiz@icloud.com'
EDITOR='vi'

# Plan9
PLAN9="$HOME/personal/dotfiles/plan9port"
font="$PLAN9/font/fixed/unicode.6x12.font"

# PATH management
PATH_DIRS=(
	"$HOME/go/bin"                 # Go binaries
	"/opt/homebrew/opt/rustup/bin" # Rust binaries
	"$PLAN9/bin"                   # Plan9 binaries
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

# Prompt
PS1='> '

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
export PLAN9
