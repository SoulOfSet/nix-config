{
  home.username = "jsabella";
  home.homeDirectory = "/home/jsabella/";

  imports = [
    ./modules/packages.nix
    #./modules/files.nix
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

  home.file = {
    ".config/alacritty/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/alacritty";
      recursive = true;
    };
    ".config/waybar/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/waybar";
      recursive = true;
    };
    ".config/hypr/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/hypr";
      recursive = true;
    };
    ".config/rofi/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/rofi";
      recursive = true;
    };
    ".config/awesome/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/awesome";
      recursive = true;
    };
    ".local/bin/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/bin";
      recursive = true;
    };
    ".local/share/rofi/themes/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/dotfiles/rofi-themes";
      recursive = true;
    };
    ".assets/wallpapers/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/assets/wallpapers";
      recursive = true;
    };
    ".assets/jar/" = {
      source = "/etc/nixos/nix-config/home-manager/user/jsabella/assets/jar";
      recursive = true;
    };
  };
}

