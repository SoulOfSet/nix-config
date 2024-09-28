{
  description = "Development environment for Pulumi Sockbowl";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; 
    flake-utils.url = "github:numtide/flake-utils";
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
            gcc
            python3
            pulumi-bin
            pulumiPackages.pulumi-language-python
          ];

          # Define the virtual environment path
          VENV_DIR = "$HOME/Documents/projects/sockbowl-pulumi/venv";

          shellHook = ''
            # Change to the desired directory
            cd ~/Documents/projects/sockbowl-pulumi

            # Create and activate virtual environment if it doesn't exist
            if [ ! -d "$VENV_DIR" ]; then
              python3 -m venv $VENV_DIR
            fi
            source $VENV_DIR/bin/activate

            # Export Pulumi passphrase
            export PULUMI_CONFIG_PASSPHRASE="sockbowl_dev"

            echo "Ready to deploy Pulumi Sockbowl stuff"
          '';
        };
      });
}

