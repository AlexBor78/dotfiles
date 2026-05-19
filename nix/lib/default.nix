# /nix/lib/default.nix

{ lib, ... }: {
	disks = import ./disks.nix { inherit lib; };
}
