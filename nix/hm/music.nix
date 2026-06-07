{ pkgs, ... }: {
	home.packages = with pkgs; [
			# music / daw
			audacity
			reaper
			pipewire.jack

			vital
			decent-sampler
			lsp-plugins # cool basic stuff
			dragonfly-reverb
			airwindows-lv2 # strange fx, some clipperes, etc
			chow-tape-model
			chow-kick
			calf # almost half usefull
			noise-repellent # denoise

			# doesn't work
#			just-a-sample # overlay
];

	# setting vst3 links up for reaper
	home.file = {
	  ".vst3/Vital.vst3".source = "${pkgs.vital}/lib/vst3/Vital.vst3";
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
		#"".source = "${}/lib/";
	};

}
