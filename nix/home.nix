{ config, lib, pkgs, username, dotsroot, ... }: {

  programs.home-manager.enable = false;

  # Don't touch !!!
  home.stateVersion = "25.11";

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # hypr
  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotsroot}/hypr"; 
    recursive = true;
    force = true;
  };

  # rofi
  home.file.".config/rofi" = {
    source = "${dotsroot}/rofi";
    recursive = true;
    force = true;
  };
}
