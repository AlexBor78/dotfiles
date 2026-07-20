# /flake.nix
# todo: refactoring
{
  description = "my main desktop nixos config";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
			tokyonight.url = "github:mrjones2014/tokyonight.nix";
#			musnix.url = "github:musnix/musnix";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nixvim = {
        url = "github:nix-community/nixvim";
#        inputs.nixpkgs.follows = "nixpkgs";
      };
			rofi-theme = {
			  url = "github:AlexBor78/Tokyonight-rofi-theme";
			  flake = false;
			};
			sops-nix = {
				url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
			};
    };
	# todo: try "@ inputs" shit
  outputs = { self, nixpkgs, home-manager, zen-browser, nixvim, tokyonight, rofi-theme, sops-nix, ... }: 
  let
    username = "alex"; # todo: change to lexa one day
    dotsroot = toString self;
		libroot = "${dotsroot}/nix/lib";
    mkSystem = hostname: nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { 
				inherit self hostname username zen-browser nixvim rofi-theme sops-nix;
		    myLib = import ./nix/lib { inherit (nixpkgs) lib; };
#				theme = import ./modules/theme.nix; # unused :)
			};
			modules = [
#				musnix.nixosModules.musnix
				./nix/hosts/${hostname}
				./nix/modules/common
				sops-nix.nixosModules.sops
				{ nixpkgs.config.allowUnfree = true; }
#				{ nixpkgs.overlays = [ (import ./nix/overlays) ]; }

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${username} = import ./nix/hm;
					home-manager.extraSpecialArgs = { 
						inherit self hostname username libroot dotsroot nixvim tokyonight rofi-theme zen-browser;
					};
				}
			];
		};

  in {

    nixosConfigurations.t480 = mkSystem "t480";
    nixosConfigurations.x13 = mkSystem "x13";
  };
}
