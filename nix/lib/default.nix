# /nix/lib/default.nix
{ lib, ... }: {
	disks = import ./disks.nix { inherit lib; };
	theme = import ./theme.nix;
	ssh_key = import ./ssh-keys.nix;
}
