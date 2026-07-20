{ lib, pkgs, username, musnix, ... } : {

	# todo: make itnwork on T480
	# fingerprint
#	services.fprintd.enable = true;
#	security.pam.services.sudo.fprintAuth = true;
#  security.pam.services.login.fprintAuth = true;
#	security.pam.services.sshd.fprintAuth = true;

	programs.ssh.startAgent = true;

	# musnix
#  musnix.enable = true;

	# passwords synth
  services.syncthing.enable = true;

#	services.flatpak.enable = true;

	# display manager
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/start-hyprland";
      user = "${username}";
    };
  };

#	# xray vpn
#	services.xray = {
#    enable = true;
#    settingsFile = "/etc/xray/config.json";
#  };

	services.happ.enable = true;

	# todo: check if right
  services.power-profiles-daemon.enable = false;
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

			START_CHARGE_THRESH_BAT0 = 75;
			STOP_CHARGE_THRESH_BAT0 = 80;

			START_CHARGE_THRESH_BAT1 = 75;
			STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };

	# docker
	#virtualisation.docker.enable = true;
	# qemu
	#virtualisation.libvirtd.enable = true;

	# labs vpn
	# tmp turn off, bcs colides with local ips
#	services.openvpn.servers = {
#		labsVPN = { config = '' config /etc/openvpn/ch_vpn_linux.ovpn ''; };
#	};
	
	# deploy vpn
	networking.wireguard.enable = true;
  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.0.0.3/24" ];
    privateKeyFile = "/var/lib/wireguard/privatekey";
    
    peers = [
      {
        publicKey = "wJ0ynClXDC8OVsGpy/cgCpMmJAH8QDHrUK0PNoMJSn0=";
        endpoint = "188.68.223.213:51820";
        
        allowedIPs = [ "10.0.0.0/24" ];
        persistentKeepalive = 25;
      }
    ];
  };
}
