{ config, pkgs, ... }:
{
  home.file = {
    ".config/alacritty/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/alacritty;
    ".config/waybar/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/waybar;
    ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/hypr;
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/rofi;
    ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/awesome;
    ".local/bin/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/bin;
    ".local/share/rofi/themes".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/rofi-themes;
    ".assets/wallpapers".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/assets/wallpapers;
    ".assets/jar".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/assets/jar;
  };
}
