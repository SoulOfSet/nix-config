{
  description = "Development environment for AI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
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
            python3
            python3Packages.langchain
            python3Packages.requests
            python3Packages.numpy
            python3Packages.pandas
            python3Packages.ollama
            python3Packages.flake8
            python3Packages.black
            python3Packages.isort

            # Extra packages
            git
            nodejs
            openjdk
            gradle
          ];

          shellHook = ''
            echo "Ready to work on AI!"
          '';
        };
      });
}

