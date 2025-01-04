set -e

# install nix
command -v nix >/dev/null || curl \
	--proto '=https' \
	--tlsv1.2 -sSf \
	-L https://install.determinate.systems/nix \
	| sh -s -- install

# install nix-darwin
cd nix-darwin-config
nix run nix-darwin -- switch --flake .

# build system
darwin-rebuild switch --flake .
