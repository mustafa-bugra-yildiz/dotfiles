set -e

# absorb env
source rc.sh

# create ssh keypair
[ -f $HOME/.ssh/id_ed25519 ] || ssh-keygen -t ed25519

# configure git
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global push.autoSetupRemote true

# install package manager
command -v brew >/dev/null ||
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v brew >/dev/null || source rc.sh

# install packages
brew bundle --cleanup

# setup rust
rustup toolchain install stable

# symlink files
ln -sf $(pwd)/rc.sh $HOME/.zshrc

mkdir -p $HOME/.config
ln -sf $(pwd)/nvim $HOME/.config/nvim
rm -f nvim/nvim

mkdir -p $HOME/.config/zed
ln -sf $(pwd)/zed-settings.json $HOME/.config/zed/settings.json

# format files
fd -e sh -x shfmt -w
fd -e lua -x stylua
