# /nix/hm/pkgs.nix

{ pkgs, zen-browser, ... }: {
	home.packages = with pkgs; [
			# cli tools
			freerdp
			wireguard-tools
			# nix-ld

			# apps (gui)
			brave
			vscodium # fast non-english text edit, etc
			obsidian
			ayugram-desktop
			pwvucontrol
			nautilus
			thunar
			gimp
			winboat
			keepassxc
			system-config-printer
			element-desktop
			
			# for indiv proj
			texlivePackages.hyphen-russian
			libreoffice
			pandoc
			texliveFull
			nerd-fonts.dejavu-sans-mono

			# minecraft
			# modrinth-app
			# prismlauncher
			# jdk17
			
			# dev tools
			clang
			clang-tools
			cmake
			gnumake
			doxygen
		#	docker # installed to system pkgs in host pkgs
			
			# ctf / low-level
			binwalk
			acpica-tools
			ghidra #ida-free # rare use and big size
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
