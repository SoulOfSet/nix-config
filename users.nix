{ lib, config, pkgs, inputs, ... }:
{
        config = {
                users.users."soulofset" = {
                        isNormalUser = true;
                        initialPassword = "12345";
                        home = "/home/soulofset/";
			extraGroups = [ "networkmanager" "wheel" ];
                        description = "Jacob Sabella";
			shell = pkgs.zsh;
                };

		home-manager = {
			extraSpecialArgs = { inherit inputs; };
			users = {
				"soulofset" = import ./home-manager/user/soulofset/home.nix;
			};
		};

        };
}
