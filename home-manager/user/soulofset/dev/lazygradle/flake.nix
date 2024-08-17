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
            python3Packages.pip
            python3Packages.virtualenv
            python3Packages.requests
            python3Packages.numpy
            python3Packages.pandas
            python3Packages.ollama
            python3Packages.flake8
            python3Packages.black
            python3Packages.isort
            python3Packages.openai
            python3Packages.sentence-transformers
            python3Packages.faiss
            python3Packages.scikit-learn
            python3Packages.jupyter
            python3Packages.jupyterlab
            python3Packages.notebook
            python3Packages.psycopg2
            python3Packages.streamlit
            python3Packages.matplotlib
            python3Packages.seaborn
            python3Packages.pypandoc
            python3Packages.textual
            python3Packages.gradle
            # Extra packages
            git
            nodejs
            openjdk
            gradle
          ];

          shellHook = ''
            echo "Ready to work on lazygradle!"
            export PYTHONUSERBASE=$PWD/.local
            mkdir -p .local/lib/python3.11/site-packages
            #pip install --user --break-system-packages textualize
            export PATH=$PWD/.local/bin:$PATH
            export PYTHONPATH=$PYTHONUSERBASE/lib/python3.11/site-packages:$PYTHONPATH
          '';
        };
      });
}


