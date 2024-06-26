{ config, pkgs, lib, ... }:

  pkgs.mkShell {
    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.stdenv.cc.cc
    ];
    NIX_LD = builtins.readFile "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  }

