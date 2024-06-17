{
  description = "Development environment for CMPSCI4200";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; 
  };

  outputs = { nixpkgs, flake-utils, ... }:
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
            python3Packages.jupyter
            python3Packages.jupyterlab
            python3Packages.notebook
          ];

          shellHook = ''
            echo "Ready to work on CMPSCI4200"
          '';
        };
      });
}

