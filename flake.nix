# /flake.nix
{
  description = "first flake try";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = { self, nixpkgs, home-manager, zen-browser, nixvim, ... }: 
  let
    username = "alex";
    dotsroot = toString self;
  in {
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
 	      inherit self username zen-browser nixvim;
				theme = import ./modules/theme.nix;
   			hostname = "t480";
      };
      modules = [
				./nix/hosts/t480
				./nix/modules/common
				

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./nix/home;
          home-manager.extraSpecialArgs = { 
            inherit self username dotsroot nixvim;
						hostname = "t480";
          };

        }
      ];
    };

    nixosConfigurations.x13 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
 	      inherit self username zen-browser nixvim;
				theme = import ./modules/theme.nix;
   			hostname = "x13";
      };
      modules = [
				./nix/hosts/x13
				./nix/modules/common
				

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./nix/home;
          home-manager.extraSpecialArgs = { 
            inherit self username dotsroot nixvim;
						hostname = "x13";
          };

        }
      ];
    };
  };
}
