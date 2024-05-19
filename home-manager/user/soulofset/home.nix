{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "soulofset";
  home.homeDirectory = "/home/soulofset/";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
        pkgs.alacritty
        pkgs.alacritty-theme
        pkgs.neovim
        pkgs.dunst
        pkgs.pipewire
        pkgs.pwvucontrol
        pkgs.wireplumber
        pkgs.xdg-desktop-portal-hyprland
        pkgs.waybar
        pkgs.rofi-wayland
        pkgs.font-awesome
        pkgs.waypaper
        pkgs.swww
        pkgs.swaybg
        pkgs.git
        pkgs.copyq
        pkgs.kitty
        pkgs.neofetch
        pkgs.networkmanager
        pkgs.networkmanagerapplet
        pkgs.docker-compose
        pkgs.w3m
        pkgs.python3
        pkgs.insomnia
        pkgs.zsh
        pkgs.oh-my-zsh
        pkgs.papirus-icon-theme
        pkgs.unzip
        pkgs.grim
        pkgs.slurp
        pkgs.killall
        pkgs.pulseaudio
        pkgs.brightnessctl
        pkgs.pamixer
        pkgs.playerctl
        pkgs.libnotify
        pkgs.wlr-randr
        pkgs.nwg-displays
        pkgs.firefox
        pkgs.lunarvim
        pkgs.jetbrains.idea-ultimate
        pkgs.thefuck
        pkgs.gnumake
        pkgs.mqttx
        pkgs.woeusb-ng
        pkgs.ntfs3g
        pkgs.fuse
        pkgs.xwaylandvideobridge
        pkgs.obs-studio
        pkgs.linux-wallpaperengine
        pkgs.caprine
        (pkgs.writeShellApplication {
          name = "discord";
          text = "${pkgs.discord}/bin/discord --use-gl=desktop";
        })
        (pkgs.makeDesktopItem {
          name = "discord";
          exec = "discord";
          desktopName = "Discord";
        })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/alacritty;
    ".config/waybar/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/waybar;
    ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/hypr;
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/rofi;
    ".local/bin/".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/bin;
    ".local/share/rofi/themes".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/dotfiles/rofi-themes;
    ".assets/wallpapers".source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/nix-config/home-manager/user/soulofset/assets/wallpapers;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/soulofset/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable oh-my-zsh
  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.theme = "jonathan";
  programs.zsh.oh-my-zsh.plugins = [ "thefuck" "git" ];  
}
