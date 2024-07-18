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
    JDTLS_JVM_ARGS = "/home/soulofset/.assets/jar/lombok.jar";
  };


  programs.chromium.enable = true;  

  programs.home-manager.enable = true;
}
