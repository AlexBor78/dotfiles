# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {

	programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
	nixpkgs.config.allowUnfree = true;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "render" ]; # Enable ‘sudo’ for the user.
  	shell = pkgs.zsh;
    packages = with pkgs; [
      tree ayugram-desktop wofi nautilus bibata-cursors lsd
    	fastfetch rofi hyprshot gh
    	grim slurp
    	wl-clipboard
			starship
			lazygit
			clang
			powertop
			gimp
			mako
			awww
			dmidecode
		  acpica-tools
		  msr-tools
		  uefitool
		  binwalk
		  ghidra
		  p7zip
		  git
		  wget
		  curl
		  grub2
		  dosfstools
		  flashrom
			ntfs3g
			cmake
			doxygen
			docker
			brave
			chromium


#			modrinth-app
#			jdk17
#			prismlauncher

			rsync
			keepassxc

			winboat
			freerdp


			sing-box
			jq
			wireguard-tools
#			ghidra ida-free

    ]++ [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  };

}
