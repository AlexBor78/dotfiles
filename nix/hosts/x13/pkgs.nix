# /nix/modules/common/user.nix


{ config, lib, pkgs, ... } : {

  environment.systemPackages = with pkgs; [
		docker
		qemu_kvm virt-manager virt-viewer adwaita-icon-theme OVMF
		openvpn3
  ]; 

#	hardware.cpu.x86.msr.settings.allow-writes = "on";

	# tmp here
#	programs.nix-ld.enable = true;
#	programs.nix-ld.libraries = with pkgs; [
#	  alsa-lib          # libasound.so.2 (звук)
#	  jack2             # JACK (аудио-сервер, часто нужен DAW)
#	  libglvnd          # OpenGL (отрисовка интерфейса)
#	  gtk3              # GTK-элементы
#	  fontconfig        # шрифты
#	  freetype          # рендер шрифтов
#	  zlib              # сжатие
#	  stdenv.cc.cc.lib  # стандартные C++ рантаймы
#	];
#  # List packages installed in system profile.
#  # You can use https://search.nixos.org/ to find more packages (and options).
}
