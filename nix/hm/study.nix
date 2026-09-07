{ pkgs, ... } : {
	
	home.packages = with pkgs; [
		krita
		libreoffice
		#virtualbox
	];	
}
