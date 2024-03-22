# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
	../global/configuration.nix
	./hardware-configuration.nix
        inputs.home-manager.nixosModules.default
    ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "desktop-gimli"; # Define your hostname.

  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

}
