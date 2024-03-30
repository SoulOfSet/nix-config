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
            nodejs_21
            python3
            python3Packages.cheroot
            python3Packages.pillow
            python3Packages.mysqlclient
            python3Packages.psycopg2
            python3Packages.python-memcached
            python3Packages.web
            python3Packages.kombu

            # Extra, non-mandatory packages
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

