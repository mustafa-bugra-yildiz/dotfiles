{ config, pkgs, lib, ... }:

{
  home.stateVersion = 5;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
