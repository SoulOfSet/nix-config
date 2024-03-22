{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
	url = "github:nix-community/home-manager/release-23.11";
        inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.nixos-vm = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/nixos-vm/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };


      nixosConfigurations.laptop-frodo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/laptop-frodo/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

      nixosConfigurations.desktop-gimli = nixpkgs.lib.nixosSystem {
           specialArgs = {inherit inputs;};
           modules = [
             ./hosts/desktop-gimli/configuration.nix
             inputs.home-manager.nixosModules.default
           ];
        };      
    };
}
