# /flake.nix
# todo: refactoring
{
description = "my main desktop nixos config";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-flatpak.url = "github:gmodena/nix-flatpak";

      nixvim = {
        url = "github:nix-community/nixvim";
#        inputs.nixpkgs.follows = "nixpkgs";
      };
      zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };

			# themes
			tokyonight.url = "github:mrjones2014/tokyonight.nix";
			rofi-theme = {
			  url = "github:AlexBor78/Tokyonight-rofi-theme";
			  flake = false;
			};

			# music
#			musnix.url = "github:musnix/musnix";
			reaper-flake.url = "github:9Prestidigitator/reaper-flake";
			liquidsfz = {
				url = "path:./nix/flakes/liquidsfz-flake";
				inputs.nixpkgs.follows = "nixpkgs";
			};



			# genshin
			aagl = {
				url = "github:ezKEa/aagl-gtk-on-nix";
        inputs.nixpkgs.follows = "nixpkgs";
			};

			# study
			kumir = {
				url = "github:ProggerX/kumir-nix";
        inputs.nixpkgs.follows = "nixpkgs";
			};
    };
	# todo: try "@ inputs" shit
  outputs = { self, nixpkgs, home-manager, zen-browser, nixvim, tokyonight, rofi-theme, sops-nix, reaper-flake, aagl, kumir, nix-flatpak, liquidsfz, ... }: 
  let
    username = "alex"; # todo: change to lexa one day
    dotsroot = toString self;
		libroot = "${dotsroot}/nix/lib";
    mkSystem = hostname: nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { 
				inherit self hostname username zen-browser nixvim rofi-theme sops-nix reaper-flake aagl kumir nix-flatpak liquidsfz;
		    myLib = import ./nix/lib { inherit (nixpkgs) lib; };
#				theme = import ./modules/theme.nix; # unused :)
			};
			modules = [
				{ nixpkgs.config.allowUnfree = true; }
				./nix/hosts/${hostname}
				./nix/modules/common
				sops-nix.nixosModules.sops
#				musnix.nixosModules.musnix
				nix-flatpak.nixosModules.nix-flatpak
				aagl.nixosModules.default
        {
          nix.settings = aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
        }
				
				{ nixpkgs.overlays = [ (import ./nix/overlays) ]; }

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${username} = import ./nix/hm;
					home-manager.extraSpecialArgs = { 
						inherit self hostname username libroot dotsroot nixvim tokyonight rofi-theme zen-browser reaper-flake liquidsfz;
					};
				}
			];
		};

  in {

    nixosConfigurations.t480 = mkSystem "t480";
    nixosConfigurations.x13 = mkSystem "x13";
  };
}
