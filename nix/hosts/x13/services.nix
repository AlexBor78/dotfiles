{ lib, pkgs, ... } : {

	# fingerprint
	services.fprintd.enable = true;
	security.pam.services.sudo.fprintAuth = true;
  security.pam.services.login.fprintAuth = true;
	security.pam.services.sshd.fprintAuth = true;
	programs.ssh.startAgent = true;

	# passwords synth
  services.syncthing.enable = true;

	# todo: refactor ai shit
	services.flatpak.enable = true;
		xdg.portal = {
	  enable = true;
	  # Важно: указываем бэкенды, чтобы работало на твоем окружении
	  # Если используешь Hyprland/Sway/GTK, оставь как есть. Если KDE - добавь xdg-desktop-portal-kde
	  extraPortals = with pkgs; [
	    xdg-desktop-portal-gtk  # для интеграции с темой/шрифтами
	    xdg-desktop-portal-wlr  # если wayland композитор на wlroots (sway/hyprland)
	  ];
	};

	# todo: move to common
	hardware.bluetooth.enable = true;
  
	# todo: move to common, remove ai slop

  # Рекомендуется: PipeWire вместо PulseAudio (лучшая поддержка BT)
  security.rtkit.enable = true;  # опционально, но рекомендуется
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;  # для совместимости с приложениями под PulseAudio
		jack.enable = true;
  };

	# have no wtf is that - should fix usb audio input devices :)
	# doesn't work btw :((
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/main.lua.d/51-usb-audio.lua" ''
      alsa_monitor.rules = {
        {
          matches = {{"node.name", "matches", ".*usb.*"}};
          apply_properties = {
            ["api.alsa.period-size"] = 1024;
            ["api.alsa.headroom"] = 4096;
            ["api.alsa.disable-batch"] = true;
          };
        }
      }
    '')
		(pkgs.writeTextDir "share/wireplumber/main.lua.d/52-usb-force-capture.lua" ''
		  alsa_monitor.rules = {
		    {
		      matches = {{"node.name", "matches", ".*Inspire.*"}};
		      actions = {
		        "update-props" = {
		          ["api.alsa.path"] = "hw:1";  -- замени 1 на номер карты из `aplay -l`
		          ["node.passive"] = false;
		        };
		      };
		    }
		  }
		'')
  ];

  
  # GUI для управления (если у тебя не тяжелое DE)
	# todo: move to pkgs mb, ot move to more propriate place
  services.blueman.enable = true;  # blueman-applet и менеджер

	# time sync (req by xray, or any tls)
	# todo: move to common
	services.timesyncd.enable = true;

	# xray vpn
	# todo: move to ./vpn.nix
	services.xray = {
    enable = true;
    # configFile передаёт файл бинарнику "как есть", без парсинга в Nix
    settingsFile = "/etc/xray/config.json";
  };

	# todo: do it proprioly
	networking.proxy.default = "socks5://127.0.0.1:10808";
	systemd.services.nix-daemon.environment = {
	  http_proxy = lib.mkForce "socks5h://127.0.0.1:10808";
	  https_proxy = lib.mkForce "socks5h://127.0.0.1:10808";
	  ALL_PROXY = lib.mkForce "socks5h://127.0.0.1:10808";
	  # Исключения: локальные адреса и .ru домены
	  NO_PROXY = lib.mkForce "localhost,127.0.0.1,.local,.ru";
	};



# todo: setup
#	services.byedpi = {
#	  enable = true;
#	  extraArgs = [ "--disorder" "1" "--auto" "torst" "--tlsrec" "1+s" ];
#	};

# todo: move all docker, qemu etc to deploy.nix like file

	# docker
	virtualisation.docker.enable = true;
#	virtualisation.docker.storageDriver = "btrfs";
#	virtualisation.docker.daemon.settings = {
#  	registry-mirrors = [
#    	"https://mirror.gcr.io"  # Официальное зеркало от Google [[57]]
#  	]; 
#	};

	# qemu
	virtualisation.libvirtd.enable = true;
#  virtualisation.libvirtd.qemu.enable = true;
#virtualisation.libvirtd.qemu.ovmf.enable = true;  # UEFI поддержка (важно для Arch)
}
