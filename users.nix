{ lib, config, pkgs, inputs, ... }:
{
        config = {
                users.users."soulofset" = {
                        isNormalUser = true;
                        initialPassword = "12345";
                        home = "/home/soulofset/";
			extraGroups = [ "networkmanager" "wheel" ];
                        description = "Jacob Sabella";
                };

		home-manager = {
			extraSpecialArgs = { inherit inputs; };
			users = {
				"soulofset" = import ./home-manager/user/soulofset/home.nix;
			};
		};

        };
}
