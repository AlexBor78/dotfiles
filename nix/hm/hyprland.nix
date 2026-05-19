# /nix/home/hyprland.nix

# todo: rewrite hyprland config on lua

{ config, pkgs, dotsroot, rofi-theme, ... } : {

	home.packages = with pkgs; [
		rofi
		mako
		awww
		grim
		slurp
		kitty
		# hyprshot # unused for now
		hyprland
		xwayland
    brightnessctl # need user in gruope "video" 
		wl-clipboard
		playerctl
		bibata-cursors
	];

  # hypr config
  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotsroot}/hypr"; 
    recursive = true;
    force = true;
  };
	
  # cursor
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # rofi
	home.file.".config/rofi" = {
	  source = "${rofi-theme}";
	  recursive = true;
	  force = true;
	};

	# wallpaper
	home.file.".config/wallpaper.png".source = "${dotsroot}/assets/wallpaper.png";
}
