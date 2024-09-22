{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      debug = {
        disable_logs = false;
      };
    };
  };
  services.cliphist = {
    enable = true;
    allowImages = true;
  }; 
}
