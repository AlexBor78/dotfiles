# /nix/hosts/x13/default.nix

{ ... }: {
	imports = [
		./hardware-configuration.nix
		./vpn.nix
		./services.nix
		./disks.nix
		./pkgs.nix
	];
}
