# /nix/modules/common/services.nix

{ pkgs, username, ... } : {
	
  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

	# time sync (req by xray, or any tls)
	services.timesyncd.enable = true;

	# bios updates
	services.fwupd.enable = true;

	# blutooth
	hardware.bluetooth.enable = true;
  services.blueman.enable = true;

	# flash automount
	services.udisks2.enable = true;
	security.polkit.enable = true;

	# upower
	services.upower.enable = true;
	services.udev.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
		jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

	security.pam.loginLimits = [
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "90"; }
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
	services.printing.drivers = with pkgs; [ hplip ];
	services.avahi = {
	  enable = true;
	  nssmdns4 = true;
	  openFirewall = true;
	};

	# xdg portals
	xdg.portal = {
	  enable = true;
	  config.common.default = [ "wlr" "gtk" ];
	  configPackages = with pkgs; [
	    xdg-desktop-portal-wlr  # screencast, csreenshoots etc for wayland 
	    xdg-desktop-portal-gtk  # file dialogs etc
	  ];

		# todo: needs for assertion, will be deleted in future :)
		extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
	};
}
