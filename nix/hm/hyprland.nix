# /nix/hm/hyprland.nix
{ config, pkgs, dotsroot, rofi-theme, caelestia, tokyonight, ... }:
{
	imports = [
		tokyonight.homeManagerModules.default
		caelestia.homeManagerModules.default
	];

	home.packages = with pkgs; [
		rofi
		kitty

		hyprland
		xwayland

		cliphist
		hyprshot
		playerctl
		wl-clipboard
    brightnessctl

		bibata-cursors
		gnome-themes-extra
	];

	# proper graphical-session start
	systemd.user.targets.hyprland-session = {
		Unit = {
			Description = "Hyprland compositor session";
			Documentation = [ "man:systemd.special(7)" ];
			BindsTo = [ "graphical-session.target" ];
			Wants = [ "graphical-session-pre.target" ];
			After = [ "graphical-session-pre.target" ];
		};
	};

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

	# caelestia shell
	programs.caelestia = {
		enable = true;
		cli.enable = true;
		systemd.enable = true;
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
