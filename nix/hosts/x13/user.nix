# /nix/modules/common/user.nix

{ config, lib, pkgs, username, ... } : {
	programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ 
			"wheel" 													# sudo
			"video" 													# brightnessctl
			"audio" 													# 
			"realtime"												# realtime audio
			"render"													# 
			"networkmanager" 
			"docker" 
			"libvirtd" "kvm" "qemu-libvirtd"
		];
  	shell = pkgs.zsh;
  };
}
