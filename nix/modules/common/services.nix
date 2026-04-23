# /nix/modules/common/services.nix

{ pkgs, ... } : {
	
  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

	# bios updates
	services.fwupd.enable = true;

	# display manager
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/start-hyprland";
      user = "alex";
    };
  };

	# upower
	services.upower.enable = true;
	services.udev.enable = true;

	# fix btop showing power
  services.udev.extraRules = ''
    SUBSYSTEM=="powercap", MODE="0444"
  '';

	services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;  # 🔥 КРИТИЧНО!
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      SATA_LINKPWR_ON_BAT = "min_power";
      PCIE_ASPM_ON_BAT = "powersupersave";
      WIFI_PWR_ON_BAT = "on";
    };
  };

  services.power-profiles-daemon.enable = false;
}
