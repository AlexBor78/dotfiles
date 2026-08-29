# /nix/home/hyprland.nix

# todo: rewrite hyprland config on lua

{ config, pkgs, dotsroot, rofi-theme, ... } : {

	home.packages = with pkgs; [
		quickshell
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
		gnome-themes-extra
	];

	# hypr stubs for lua
	home.file.".local/share/hypr/stubs" = {
		source = "${pkgs.hyprland}/share/hypr/stubs";
	};

  # hypr config
  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotsroot}/hypr"; 
    recursive = true;
    force = true;
  };

  # quickshell
  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotsroot}/quickshell"; 
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

	# dark theme
	gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
		iconTheme = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};

		gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
		gtk4 = {
			theme = null;
			extraConfig.gtk-application-prefer-dark-theme = true;
		};
	};

dconf.settings = {
  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
};
}
