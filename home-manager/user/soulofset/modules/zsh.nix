{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.theme = "jonathan";
  programs.zsh.oh-my-zsh.plugins = [ "thefuck" "git" ];
}
