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
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;  

  networking.hostName = "desktop-aragorn"; # Define your hostname.
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" "192.168.50.92" ];
  
  # Enable Steam
  programs.steam.enable = true;
  
  # Wayland
  programs.xwayland.enable = true;
  programs.hyprland.xwayland.enable = true;
  
  # Enable vbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "soulofset" ];

  # Enable nix-ld
  programs.nix-ld.enable = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Setup docker
  virtualisation.docker = {
    enable = true;
  };

  # Setup ollama
  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";
  services.ollama.listenAddress = "localhost:11434";
  
  networking.firewall = {
    allowedTCPPorts = [ 11434 ];
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

}
