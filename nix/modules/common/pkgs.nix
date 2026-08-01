# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {
nixpkgs.config.permittedInsecurePackages = [ "electron-40.10.5" ];

  environment.systemPackages = with pkgs; [
    wget git curl 
		htop btop 
		tree jq
		zip unzip
		file
		vim

		# hardware stuff utils
		usbutils pciutils lm_sensors smartmontools
		linux-firmware
		intel-gpu-tools
		compsize
		overskride

		# fs utils
		exfatprogs btrfs-progs

		# nix utils
		deadnix nix-diff

		iproute2 
	  dnsutils    # dig, host
 	  openssl     # проверка сертификатов
		p7zip
		rsync
		dosfstools
		ntfs3g
  ];
}
