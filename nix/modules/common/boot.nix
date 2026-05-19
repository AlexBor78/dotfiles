# /nix/modules/common/boot.nix

{ lib, ...} : {
	
  # Bootloader (grub)
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
		};
  };

  boot.kernelParams = [
		# enable zswap (zram)
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=20"
    "zswap.zpool=z3fold" 
  ];
}
