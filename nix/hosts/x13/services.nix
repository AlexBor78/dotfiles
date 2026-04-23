{ pkgs, ... } : {

	# fingerprint
	services.fprintd.enable = true;
	security.pam.services.sudo.fprintAuth = true;
  security.pam.services.login.fprintAuth = true;
	security.pam.services.sshd.fprintAuth = true;
	programs.ssh.startAgent = true;

	# passwords synth, temporary here
  services.syncthing.enable = true;

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

 hardware.bluetooth.enable = true;
  
  # Рекомендуется: PipeWire вместо PulseAudio (лучшая поддержка BT)
  security.rtkit.enable = true;  # опционально, но рекомендуется
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;  # для совместимости с приложениями под PulseAudio
  };
  
  # GUI для управления (если у тебя не тяжелое DE)
  services.blueman.enable = true;  # blueman-applet и менеджер


#	services.byedpi = {
#	  enable = true;
#	  extraArgs = [ "--disorder" "1" "--auto" "torst" "--tlsrec" "1+s" ];
#	};

	# docker
	virtualisation.docker.enable = true;
#	virtualisation.docker.storageDriver = "btrfs";
#	virtualisation.docker.daemon.settings = {
#  	registry-mirrors = [
#    	"https://mirror.gcr.io"  # Официальное зеркало от Google [[57]]
#  	]; 
#	};

	# qemu
#	virtualisation.libvirtd.enable = true;
#  virtualisation.libvirtd.qemu = true;
}
