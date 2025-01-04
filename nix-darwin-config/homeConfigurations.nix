{ config, pkgs, ... }: {
  home.username = "mby";
  home.homeDirectory = "/Users/mby";
  home.stateVersion = "24.11";

  home.packages = with pkgs;
    [
      neovim

      # formatters
      shfmt
      nixfmt

      # tools
      fd
    ];

  home.shellAliases = {
    vi = "nvim";
  };

  home.sessionVariables = { EDITOR = "nvim"; };

  # programs.home-manager.enable = true;
  # programs.zsh.enable = true;

  # Git config
  home.file.".gitconfig".text = ''
    [user]
    	name = mustafa-bugra-yildiz
    	email = mustafa.bugra.yildiz@icloud.com
    [core]
    	editor = nvim
    [push]
    	autoSetupRemote = true
  '';
}
