{
  description = "gwathlyn font flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        src = pkgs.fetchzip {
          url = "https://www.1001fonts.com/download/gwathlyn-demo.zip";
          hash = "sha256-Fq+wzw2a1E+SK0INB1g1GIcMEXKxDN9lR8+5m7Kbdx0=";
          stripRoot = false;         # keep folder structure
        };
      in {
				packages.default = pkgs.runCommand "gwathlyn-demo" { } ''
						mkdir -p $out/share/fonts/opentype
				cp "${src}/GwathlynDEMO-Regular.otf" $out/share/fonts/opentype/
			'';
		});
}
