# /nix/home/default.nix

{ config, lib, pkgs, username, dotsroot, nixvim, tokyonight, zen-browser, ... } : {
	
	# enable home-managegr
  programs.home-manager.enable = true;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

	imports = [
		tokyonight.homeManagerModules.default
		./pkgs.nix
		./music.nix
		./shell.nix
		./nixvim.nix
		./hyprland.nix
	];
}
