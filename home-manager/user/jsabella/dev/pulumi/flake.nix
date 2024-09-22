{
  description = "Development environment for Pulumi";

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
            pkgs.gcc
            pkgs.python3
            pkgs.pulumi-bin
            pkgs.pulumiPackages.pulumi-language-python
          ];

          shellHook = ''
            echo "Ready to deploy pulumi stuff"
          '';
        };
      });
}


