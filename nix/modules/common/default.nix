# /nix/modules/common/default.nix
{ config, lib, pkgs, username, ... } : {

	# Don't change
  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	imports = [
		./boot.nix
		./network.nix
		./services.nix
		./pkgs.nix
	];

	# paltform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # microcode updates
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

	# todo: predefine some stuff propertly
#	users.users.${username}.isNormalUser = true;
#	users.users.${username}.extraGroups = [ "wheel" "networkmanager" ];

#	# minecraft shit
#	hardware.graphics = {
#	  enable = true;
#	  enable32Bit = true;  # нужно для некоторых нативных библиотек
#	};
}
