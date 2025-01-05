set -e

# absorb env
. rc.sh

# create ssh keypair
[ -f $HOME/.ssh/id_ed25519 ] || ssh-keygen -t ed25519

# configure git
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

# install package manager
command -v brew >/dev/null ||
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v brew >/dev/null || . rc.sh

# install packages
brew bundle

# format files
fd -e sh -x shfmt -w
fd -e lua -x stylua

# symlink files
mkdir -p $HOME/.config
ln -sf $(pwd)/rc.sh $HOME/.zshrc
ln -sf $(pwd)/nvim $HOME/.config/nvim
rm -f nvim/nvim
