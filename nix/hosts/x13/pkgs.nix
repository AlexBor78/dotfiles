# /nix/modules/common/user.nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
		docker
#		qemu_kvm virt-manager virt-viewer adwaita-icon-theme OVMF
		openvpn3
		stdenv.cc.cc.lib
		steam-run
  ]; 

	services.flatpak = {
		enable = true;
		remotes = [
			{
				name = "flathub";
				location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
			}
		];
		packages = [
			"fm.reaper.Reaper"
		];
		overrides = {
			"fm.reaper.Reaper" = {
				Context = {
					# "host" дает доступ ко всей ФС, но явно добавим домашние папки с плагинами
					filesystems = [ 
						"host" 
						"~/.vst3" 
						"~/.lv2"
						# Если проекты на другом диске, добавь его путь, например:
						# "/mnt/music"
					];
				};
				Environment = {
					# Указываем Reaper точные пути к плагинам
					VST3_PATH = "/home/alex/.vst3";
					LV2_PATH = "/home/alex/.lv2";
					# На всякий случай, если Reaper ищет в других местах
					VST_PATH = "/home/alex/.vst";
				};
			};
		};
};

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
