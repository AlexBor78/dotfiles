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
			decent-sampler
			dragonfly-reverb
			lsp-plugins
			just-a-sample # overlay

			# apps (gui)
			brave
			obsidian
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
			ghidra #ida-free # rare use and big size

			# unused
			# bios modding or something shit
#			msr-tools # unused 
#			uefitool # unused gui bios something
#			dmidecode # unused (hardware info something util)
#			flashrom
#			powertop
	]++ [ zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default];

	# setting vst3 links up for reaper
	home.file = {
	  ".vst3/DecentSampler.vst3".source = "${pkgs.decent-sampler}/lib/vst3/DecentSampler.vst3";
	  ".vst3/DragonflyEarlyReflections.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyEarlyReflections.vst3";
	  ".vst3/DragonflyHallReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyHallReverb.vst3";
	  ".vst3/DragonflyPlateReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyPlateReverb.vst3";
	  ".vst3/DragonflyRoomReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyRoomReverb.vst3";
	  ".vst3/lsp-plugins.vst3".source = "${pkgs.lsp-plugins}/lib/vst3/lsp-plugins.vst3";
	  ".vst3/Vital.vst3".source = "${pkgs.vital}/lib/vst3/Vital.vst3";
		".vst3/JustASample.vst3".source = "${pkgs.just-a-sample}/lib/vst3/JustASample.vst3";
	};

}
