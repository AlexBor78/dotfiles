# /nix/hosts/x13/services.nix
{ lib, pkgs, username, musnix, ... }:
{
	imports = [
		./network.nix
		./sandbox.nix
	];

	# display manager
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/start-hyprland";
      user = "${username}";
    };
  };

	# fingerprint
	services.fprintd.enable = true;
	security.pam.services.sudo.fprintAuth = true;
  security.pam.services.login.fprintAuth = true;
	security.pam.services.sshd.fprintAuth = true;

	programs.ssh.startAgent = true;

	# passwords synth
  services.syncthing.enable = true;

#	services.flatpak.enable = true;

	# tunderbolt
	services.hardware.bolt.enable = true;


  services.power-profiles-daemon.enable = true;
	systemd.tmpfiles.rules = [
		"w /sys/class/power_supply/BAT0/charge_control_end_threshold - - - - 80"
	];

	services.tlp = {
    enable = false;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;
			CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      SATA_LINKPWR_ON_BAT = "min_power";
      PCIE_ASPM_ON_BAT = "powersupersave";
      WIFI_PWR_ON_BAT = "on";

			START_CHARGE_THRESH_BAT0 = 75;
			STOP_CHARGE_THRESH_BAT0 = 80;

			START_CHARGE_THRESH_BAT1 = 75;
			STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };

}
