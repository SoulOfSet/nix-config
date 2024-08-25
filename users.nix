{ lib, config, pkgs, inputs, ... }:
{
        config = {
                users.users."jsabella" = {
                        isNormalUser = true;
                        initialPassword = "12345";
                        home = "/home/jsabella/";
			extraGroups = [ "networkmanager" "wheel" "docker" ];
                        description = "Jacob Sabella";
			shell = pkgs.zsh;
                };

		home-manager = {
			extraSpecialArgs = { inherit inputs; };
			users = {
				"jsabella" = import ./home-manager/user/jsabella/home.nix;
			};
		};

        };
}
