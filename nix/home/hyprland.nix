# /nix/home/hyprland.nix

{ config, pkgs, dotsroot, ... } : {
	
  # hypr
  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotsroot}/hypr"; 
    recursive = true;
    force = true;
  };

   home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
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
    source = "${dotsroot}/rofi";
    recursive = true;
    force = true;
  };
}
