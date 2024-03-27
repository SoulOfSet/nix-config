 {
  description = "Development environment for Animal Shelter Manager v3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11"; # You might want to use the latest stable version
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
            # Python and necessary modules
            python3
            python3Packages.cheroot
            python3Packages.pillow
            python3Packages.mysqlclient
            python3Packages.psycopg2
            python3Packages.python-memcached

            # Extra, non-mandatory packages
            imagemagick
            wkhtmltopdf
            python3Packages.xhtml2pdf
            python3Packages.reportlab
            python3Packages.requests
            python3Packages.boto3
            python3Packages.openpyxl
            python3Packages.qrcode
            python3Packages.stripe
          ];

          shellHook = ''
            echo "Ready to work on Animal Shelter Manager v3!"
          '';
        };
      });
}

