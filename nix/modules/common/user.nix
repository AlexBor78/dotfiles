# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {

	programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
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
			swww
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

#			ghidra ida-free
    ];
  };

	hardware.cpu.x86.msr.settings.allow-writes = "on";

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    wget git curl htop btop hyprland kitty
    brightnessctl
		upower
  ] ++ [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
