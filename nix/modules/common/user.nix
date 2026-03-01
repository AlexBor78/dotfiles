# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {

	programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  	shell = pkgs.zsh;
    packages = with pkgs; [
      tree ayugram-desktop wofi nautilus bibata-cursors lsd
    ];
  };


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    wget git curl htop btop hyprland kitty vscodium
    firefox 
    fastfetch rofi hyprshot gh
    brightnessctl
    grim slurp
    wl-clipboard
		lazygit
		clang
		starship
		upower
  ] ++ [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
