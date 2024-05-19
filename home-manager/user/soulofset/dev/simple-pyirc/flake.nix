{
  description = "Development environment for Animal Shelter Manager v3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11"; 
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Python and necessary modules
            gnumake
            python3
            python3Packages.pytest
            python3Packages.testcontainers
  
          ];

          shellHook = ''
            echo "Ready to work on Simple PyIRC"
          '';
        };
      });
}

