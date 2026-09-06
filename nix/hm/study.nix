{ pkgs, ... } : {
	
	home.packages = with pkgs; [
		krita
		#virtualbox
	];	
}
