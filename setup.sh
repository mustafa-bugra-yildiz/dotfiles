set -e

# install brew
test -f /opt/homebrew/bin/brew >/dev/null ||
	/bin/bash -c \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install nix
command -v nix >/dev/null || curl \
	--proto '=https' \
	--tlsv1.2 -sSf \
	-L https://install.determinate.systems/nix |
	sh -s -- install

# install nix-darwin
cd nix-darwin-config
nix run nix-darwin -- switch --flake .

# format files
fd -e nix -x nixfmt
fd -e sh -x shfmt -w
