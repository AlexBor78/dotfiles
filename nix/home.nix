{ config, lib, pkgs, username, dotsroot, ... }: {

  programs.home-manager.enable = false;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = lib.mkForce "/home/${username}";

  # hypr
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
    source = "${dotsroot}/rofi";
    recursive = true;
    force = true;
  };
}
