# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {

  environment.systemPackages = with pkgs; [
    wget git curl 
		htop btop 
		tree jq
		unzip
		file

		# hardware stuff utils
		#usbutils pciutils lm-sensors smartmontools

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
