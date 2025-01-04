{ self, nix-darwin, home-manager, ... }:
let
  configuration = { pkgs, ... }: {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = [];

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
      casks = [ "ghostty" ];
    };
  };
in {
  "Mustafas-MacBook-Air" = nix-darwin.lib.darwinSystem {
    modules = [
      configuration
      home-manager.darwinModules.home-manager
      {
        users.users.mby.home = "/Users/mby";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.mby = import ./homeConfigurations.nix;
      }
    ];
  };
}
