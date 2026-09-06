{ pkgs, reaper-flake, ... }: {

	imports = [
		reaper-flake.homeModules.reaper
	];

	home.packages = with pkgs; [
			# music / daw
			audacity
			#reaper # using reaper-flake down in this file
			pipewire.jack
			alsa-scarlett-gui
			#patchage # patch bay for jack

			vital
			surge-xt # vital analog
			decent-sampler
			lsp-plugins # cool basic stuff
			dragonfly-reverb
			airwindows-lv2 # strange fx, some clipperes, etc
			chow-tape-model
			chow-kick
			calf # almost half usefull
			noise-repellent # denoise
			openutau

#			ardour
#			x42-plugins

			# doesn't work
#			just-a-sample # overlay
	];

programs.reaper = {
  enable = true;
  
	theme = {
    active = "Reapertips Theme";
    packages = [
      reaper-flake.packages.${pkgs.system}.reapertips-theme
    ];
  };

	ini.sections = {
		reaper = {
			projectpath = "/data/hobbies/music/projects/reaper";
			projectcreatesubdir = "1";
		};
	};

  extensions.reapack = {
    enable = true;
    repositories = [
      { name = "ReaTeam Themes"; url = "https://github.com/ReaTeam/Themes/raw/master/index.xml"; }
    ];
    packages = [
    ];
  };

  #experimental.swell-wayland.enable = true;
};


	# setting vst3 links up for reaper
	home.file = {
	  ".vst3/vital.vst3".source = "${pkgs.vital}/lib/vst3/vital.vst3";
	  ".vst3/Surge XT.vst3".source = "${pkgs.surge-xt}/lib/vst3/Surge XT.vst3";
	  ".vst3/Surge XT Effects.vst3".source = "${pkgs.surge-xt}/lib/vst3/Surge XT Effects.vst3";
	  ".vst3/DecentSampler.vst3".source = "${pkgs.decent-sampler}/lib/vst3/DecentSampler.vst3";
	  ".vst3/lsp-plugins.vst3".source = "${pkgs.lsp-plugins}/lib/vst3/lsp-plugins.vst3";
	  ".vst3/DragonflyEarlyReflections.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyEarlyReflections.vst3";
	  ".vst3/DragonflyHallReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyHallReverb.vst3";
	  ".vst3/DragonflyPlateReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyPlateReverb.vst3";
	  ".vst3/DragonflyRoomReverb.vst3".source = "${pkgs.dragonfly-reverb}/lib/vst3/DragonflyRoomReverb.vst3";
		".vst3/ChowKick.vst3".source = "${pkgs.chow-kick}/lib/vst3/ChowKick.vst3";
		".vst3/CHOWTapeModel.vst3".source = "${pkgs.chow-tape-model}/lib/vst3/CHOWTapeModel.vst3";

		".lv2/calf.lv2".source = "${pkgs.calf}/lib/lv2/calf.lv2";
		".lv2/Airwindows.lv2".source = "${pkgs.airwindows-lv2}/lib/lv2/Airwindows.lv2";
		".lv2/nrepellent.lv2".source = "${pkgs.noise-repellent}/lib/lv2/nrepellent.lv2";
		".lv2/x42-plugins.lv2".source = "${pkgs.x42-plugins}/lib/lv2";
		#"".source = "${}/lib/";
	};

}
