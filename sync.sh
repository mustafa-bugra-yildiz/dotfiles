set -e

# create ssh keypair
[ -f $HOME/.ssh/id_ed25519 ] || ssh-keygen -t ed25519

# configure git
git config --global core.editor "$EDITOR"
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git config --global push.autoSetupRemote true

# install package manager
command -v brew >/dev/null ||
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v brew >/dev/null || source rc.sh

# install packages
brew bundle --cleanup

# absorb env
source rc.sh

# setup rust
rustup toolchain install stable

# setup nodejs
nvm install --lts
nvm use --lts

# symlink files
ln -sf $(pwd)/rc.sh $HOME/.zshrc

mkdir -p $HOME/.config
ln -sf $(pwd)/nvim $HOME/.config/nvim
rm -f nvim/nvim

# format files
find . -ipath '*.sh' -exec shfmt -w '{}' \;
