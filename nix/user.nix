{ config, lib, pkgs, username, zen-browser, ... }: {
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree ayugram-desktop wofi nautilus  
    ];
  };

  # programs.firefox.enable = true;

  # environment.systemPackages = [
  #   inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  # ];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget git curl htop btop hyprland kitty vscodium
    firefox 
    fastfetch rofi hyprshot
#    zen-browser
  ] ++ [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/Hyprland";
      user = "alex";
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
