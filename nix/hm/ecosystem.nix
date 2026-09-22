# /nix/hm/ecosystem.nix
{ ... }:
{
	# stream audio phone -> laptop via BT
	services.mpris-proxy.enable = true;
  xdg.configFile."wireplumber/wireplumber.conf.d/51-phone-audio.conf".text = ''
    monitor.bluez.properties = {
      bluez5.roles = [ a2dp_sink a2dp_source hsp_hs hsp_ag hfp_hf hfp_ag ]
      bluez5.hfphsp-backend = "native"
      bluez5.enable-msbc = true
    }

    monitor.bluez.rules = [
      {
        matches = [ { device.name = "~bluez_card.9C_9E_D5_94_23_B2" } ]
        actions = {
          update-props = {
            bluez5.auto-connect = [ a2dp_sink hfp_hf ]
          }
        }
      }
    ]
  '';

	# KDE Connect
	services.kdeconnect.enable = true;
}
