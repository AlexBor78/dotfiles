{
  description = "first flake try";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manaer = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = { self, nixpkgs, home-manager, zen-browser, ... }: 
  let
    username = "alex";
    hostname = "t480";
    dotsroot = toString self;
  in {
    nixosConfigurations.t480 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
        inherit self hostname username zen-browser;
      };
      modules = [
        ./nix/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./nix/home.nix;
          home-manager.extraSpecialArgs = { 
            inherit self username dotsroot;
          };

        }
      ];
    };
  };
}
