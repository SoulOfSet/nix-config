{ config, pkgs, inputs, ... }:

{
  home.username = "soulofset";
  home.homeDirectory = "/home/soulofset/";


  imports = [
    ./modules/packages.nix
    ./modules/files.nix
    ./modules/zsh.nix
    ./modules/nixvim/nixvim.nix
    ./modules/services.nix
  ];

  home.stateVersion = "24.05";

  home.sessionVariables = {
    # Add your environment variables here
  };


  programs.chromium.enable = true;  

  programs.home-manager.enable = true;
}
