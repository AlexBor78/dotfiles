# /nix/home/default.nix

# todo: may move home to modules/

{ config, lib, pkgs, username, dotsroot, nixvim, tokyonight, ... } : {
	
	# enable home-managegr
  programs.home-manager.enable = true;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

	imports = [
		tokyonight.homeManagerModules.default
		./shell.nix
		./nixvim.nix
		./hyprland.nix
	];

	# wtf is that
	# todo: refactor
	tokyonight = {
		enable = true;
		style = "night";
#		transparent = false;
	};
}
