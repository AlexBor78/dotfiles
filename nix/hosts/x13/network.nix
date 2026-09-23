# /nix/hosts/x13/network.nix

{ ... }:
{
	services.happ.enable = true;

	# KDE Connect
	programs.kdeconnect.enable = true;

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
