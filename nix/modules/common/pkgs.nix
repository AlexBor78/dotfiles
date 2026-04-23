# /nix/modules/common/user.nix

{ config, lib, pkgs, username, zen-browser, ... } : {

  environment.systemPackages = with pkgs; [
    wget git curl htop btop kitty
    brightnessctl
		upower
    libvirt
    bridge-utils
	  bind        # nslookup, dig
	  dnsutils    # dig, host
 	  openssl     # проверка сертификатов
		tlp
  ] ++ [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
