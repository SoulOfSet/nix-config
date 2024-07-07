{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-vm/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
        ];
      };

      nixosConfigurations.laptop-frodo = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop-frodo/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
        ];
      };

      nixosConfigurations.desktop-aragorn = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop-aragorn/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
        ];
      };

    };
}
