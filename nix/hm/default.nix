# /nix/hm/default.nix
{ lib, username, ... }:
{
	# enable home-managegr
  programs.home-manager.enable = true;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

	imports = [
		./pkgs.nix
		./ecosystem.nix
		./music.nix
		./study.nix
		./shell.nix
		./nixvim.nix
		./hyprland.nix
	];
}
