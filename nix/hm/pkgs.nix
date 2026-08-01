# /nix/hm/pkgs.nix

{ pkgs, zen-browser, ... }: {
	home.packages = with pkgs; [
			# cli tools
			#freerdp
			wireguard-tools
			# nix-ld

			# video editing
			#blender
			#kdePackages.kdenlive
			#python3
			#python3Packages.pillow
			#python3Packages.numpy
			#python3Packages.opencv4
			#imagemagick
			#obs-studio

			# desktop apps (gui)
			#brave
			#vscodium
			obsidian
			ayugram-desktop
			pwvucontrol
			nautilus
			#thunar
			#gimp
			keepassxc
			system-config-printer
			element-desktop
			motrix  # downloads manager
			clapper # player
			vlc  		# if clapper goes bad 
			
#			# for indiv proj
#			texlivePackages.hyphen-russian
#			libreoffice
#			pandoc
#			texliveFull
#			nerd-fonts.dejavu-sans-mono

			# minecraft
			#jdk17 
			jdk25
			pandora-launcher
			#modrinth-app
#			modrinth-app-unwrapped
#			prismlauncher
			
			# dev tools
			clang
			clang-tools
			cmake
			gnumake
			doxygen
			
			# ctf / low-level
			binwalk
			acpica-tools
			#ghidra # unused for now
			rizinPlugins.rz-ghidra
#			ida-free
			rizin cutter
			cliqr zbar

			# unused
			# bios modding or something shit
#			msr-tools # unused 
#			uefitool # unused gui bios something
#			dmidecode # unused (hardware info something util)
#			flashrom
#			powertop
	]++ [ zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default];
}
