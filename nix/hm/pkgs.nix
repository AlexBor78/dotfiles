# /nix/hm/pkgs.nix

{ pkgs, zen-browser, ... }: {
	home.packages = with pkgs; [
			# cli tools
			freerdp
			wireguard-tools
			# nix-ld

			# music / daw
			reaper # need vpn in russia :((
			pipewire.jack
			vital
			audacity
			pwvucontrol

			# apps (gui)
			brave
			ayugram-desktop
			nautilus
			gimp
			winboat
			keepassxc
			system-config-printer

			# minecraft
			# modrinth-app
			# prismlauncher
			# jdk17
			
			# dev tools
			clang
			cmake
			doxygen
		#	docker # installed to system pkgs in host pkgs
			
			# ctf / low-level
			binwalk
			acpica-tools
			# ghidra ida-free # rare use and big size

			# unused
			# bios modding or something shit
#			msr-tools # unused 
#			uefitool # unused gui bios something
#			dmidecode # unused (hardware info something util)
#			flashrom
#			powertop
	]++ [ zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default];
}
