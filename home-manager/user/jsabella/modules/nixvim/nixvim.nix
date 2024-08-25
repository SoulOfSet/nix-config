{ config, pkgs, inputs, ... }:
{

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./globals.nix
    ./plugins.nix
    ./keymappings.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    extraConfigVim = ''
      autocmd VimLeave * call setreg('+', getreg('"'))
      '';

  };

  

}
