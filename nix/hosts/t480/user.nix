# /nix/modules/common/user.nix

{ config, lib, pkgs, username, ... } : {
	programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
  	shell = pkgs.zsh;
    extraGroups = [ 
			"wheel" 													# sudo
			"video" 													# brightnessctl
			"realtime"												# realtime audio
			"audio" 													# 
			"render"													# 
			"networkmanager" 
			"docker" 
			"libvirtd" "kvm" "qemu-libvirtd"
		];
  };
}
