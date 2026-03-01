# /nix/home/default.nix

{ config, lib, pkgs, username, dotsroot, nixvim, ... } : {
	
	# enable home-managegr
  programs.home-manager.enable = true;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

	imports = [
		./shell.nix
		./nixvim.nix
		./hyprland.nix
	];
}
