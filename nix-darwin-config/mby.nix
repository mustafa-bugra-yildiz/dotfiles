{ config, pkgs, ... }: {
  home.username = "mby";
  home.homeDirectory = "/Users/mby";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # formatters
    shfmt
    nixfmt

    # tools
    fd
  ];

  # Shell config
  programs.zsh.enable = true;
  home.sessionVariables = { EDITOR = "nvim"; };

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
