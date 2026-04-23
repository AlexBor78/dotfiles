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
			hyprland
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
#			reaper # need vpn in russia :((
#			nix-ld


#			modrinth-app
#			jdk17
#			prismlauncher

			rsync
			keepassxc

			winboat
			freerdp
			
			byedpi


			sing-box
			jq
			wireguard-tools
#			ghidra ida-free

    ];
  };

	hardware.cpu.x86.msr.settings.allow-writes = "on";

	# tmp here
#	programs.nix-ld.enable = true;
#	programs.nix-ld.libraries = with pkgs; [
#	  alsa-lib          # libasound.so.2 (звук)
#	  jack2             # JACK (аудио-сервер, часто нужен DAW)
#	  libglvnd          # OpenGL (отрисовка интерфейса)
#	  gtk3              # GTK-элементы
#	  fontconfig        # шрифты
#	  freetype          # рендер шрифтов
#	  zlib              # сжатие
#	  stdenv.cc.cc.lib  # стандартные C++ рантаймы
#	];
#  # List packages installed in system profile.
#  # You can use https://search.nixos.org/ to find more packages (and options).
#  environment.systemPackages = with pkgs; [
#  ] ++ [
#    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
#  ];
}
