# /nix/hm/default.nix
{ lib, username, sops-nix, ... }:
{
	# enable home-managegr
  programs.home-manager.enable = true;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

	imports = [
		sops-nix.homeManagerModules.sops
		./pkgs.nix
		./ecosystem.nix
		./music.nix
		./study.nix
		./shell.nix
		./nixvim.nix
		./hyprland.nix
	];
}
