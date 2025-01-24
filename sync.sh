set -e

# ssh keypair
[ -f $HOME/.ssh/id_ed25519 ] || ssh-keygen -t ed25519

# git config
git config --global core.editor "$EDITOR"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global push.autoSetupRemote true

# homebrew
command -v brew >/dev/null ||
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source rc.sh

# bun
command -v bun >/dev/null || curl -fsSL https://bun.sh/install | bash

# js tools
command -v concurrently >/dev/null || bun i -g concurrently
command -v tailwindcss >/dev/null || bun i -g tailwindcss @tailwindcss/cli

# packages and env
brew bundle --cleanup
source rc.sh

# symlink files
ln -sf $(pwd)/rc.sh $HOME/.zshrc

# format files
find . -ipath '*.sh' -exec shfmt -w '{}' \;
