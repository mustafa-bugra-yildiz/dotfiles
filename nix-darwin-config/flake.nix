{
  description = "mby's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = with pkgs; [

          # Code editor
          neovim

          # Formatters
          shfmt
          nixfmt

          # CLI tools
          fd

        ];

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        # Use TouchID with sudo.
        security.pam.enableSudoTouchIdAuth = true;

        # Aliases
        environment.shellAliases = { vi = "nvim"; };

        # Git config
        environment.etc."gitconfig".text = ''
          [user]
          	name = mustafa-bugra-yildiz
          	email = mustafa.bugra.yildiz@icloud.com
          [core]
          	editor = nvim
          [push]
          	autoSetupRemote = true
        '';

        # Homebrew for casks
        homebrew = {
          enable = true;
          onActivation.cleanup = "zap";
          casks = [ "ghostty" ];
        };
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Mustafas-MacBook-Air" =
        nix-darwin.lib.darwinSystem { modules = [ configuration ]; };
    };
}
