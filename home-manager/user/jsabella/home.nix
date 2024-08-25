{ config, pkgs, inputs, ... }:

{
  home.username = "jsabella";
  home.homeDirectory = "/home/jsabella/";


  imports = [
    ./modules/packages.nix
    ./modules/files.nix
    ./modules/zsh.nix
    ./modules/nixvim/nixvim.nix
    ./modules/services.nix
  ];

  home.stateVersion = "24.05";

  home.sessionVariables = {
    JDTLS_JVM_ARGS = "/home/jsabella/.assets/jar/lombok.jar";
  };


  programs.chromium.enable = true;  
  programs.home-manager.enable = true;
}
