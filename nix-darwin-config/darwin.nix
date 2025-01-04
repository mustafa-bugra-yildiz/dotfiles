{ self, nix-darwin, home-manager, nixvim, ... }:
let
  configuration = { pkgs, ... }: {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = [ ];

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

    # Homebrew for casks
    homebrew = {
      enable = true;
      onActivation.cleanup = "uninstall";
      casks = [ "ghostty" "arc" ];
    };
  };
in {
  "Mustafas-MacBook-Air" = nix-darwin.lib.darwinSystem {
    modules = [
      # Configuration for macOS-system
      configuration

      # Configuration for macOS-user
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        # My user
        users.users.mby.home = "/Users/mby";
        home-manager.users.mby = import ./mby.nix;
      }

      # Configuration for neovim
      nixvim.nixDarwinModules.nixvim
      { programs.nixvim = import ./nixvim.nix; }
    ];
  };
}
