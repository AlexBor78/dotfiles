# /nix/hm/study.nix
{ pkgs, ... }:
{
	home.packages = with pkgs; [
		krita
		libreoffice
		#virtualbox
	];	
}
