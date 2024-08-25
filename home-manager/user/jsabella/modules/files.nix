{ config, pkgs, ... }:
{
  home.file = {
    ".config/alacritty/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/alacritty;
    ".config/waybar/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/waybar;
    ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/hypr;
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/rofi;
    ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/awesome;
    ".local/bin/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/bin;
    ".local/share/rofi/themes".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/rofi-themes;
    ".assets/wallpapers".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/assets/wallpapers;
    ".assets/jar".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/jsabella/assets/jar;
  };
}
