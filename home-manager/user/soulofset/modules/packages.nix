{ pkgs, ... }:
{

  nixpkgs.overlays = [
    (self: super: {
      linux-wallpaperengine = self.callPackage ../../../packages/linux-wallpaperengine/default.nix { };
    })
  ];

  

  home.packages = [
    pkgs.linux-wallpaperengine
    pkgs.alacritty
    pkgs.dunst
    pkgs.pipewire
    pkgs.pwvucontrol
    pkgs.wireplumber
    pkgs.waybar
    pkgs.rofi-wayland
    pkgs.font-awesome
    pkgs.waypaper
    pkgs.swww
    pkgs.swaybg
    pkgs.git
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
    pkgs.wlrctl
    pkgs.wlroots
    pkgs.nwg-displays
    pkgs.firefox
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.pycharm-professional
    pkgs.thefuck
    pkgs.gnumake
    pkgs.mqttx
    pkgs.woeusb-ng
    pkgs.ntfs3g
    pkgs.fuse
    pkgs.xwaylandvideobridge
    pkgs.obs-studio
    pkgs.caprine-bin
    pkgs.thunderbird
    pkgs.btop
    pkgs.terraform
    pkgs.awscli2
    pkgs.libstdcxx5
    pkgs.k9s
    pkgs.spotify
    pkgs.xsel
    pkgs.jq
    pkgs.obsidian
    pkgs.micromamba
    pkgs.btop
    pkgs.zulu
    pkgs.glew
    pkgs.wl-clipboard
    pkgs.lazygit
    pkgs.lazysql
    pkgs.jdt-language-server
    pkgs.prismlauncher
    pkgs.postman
    pkgs.nodejs_22
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


}
