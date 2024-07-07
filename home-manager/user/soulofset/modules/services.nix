{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.xwayland.enable = true;
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
