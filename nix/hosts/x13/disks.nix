# /nix/hosts/x13/disks.nix

{ myLib, ... }: {
  
  fileSystems = {
    "/" =     myLib.disks.mkExt4BL	"nixos_root";
    "/boot" = myLib.disks.mkFatBL   "boot";
    "/home" = myLib.disks.mkBtrfs 	{ device = "/dev/laptop/shared_home"; comp = "zstd"; };
  };

  swapDevices = [ (myLib.disks.mkSwap "/dev/disk/by-label/swap") ] ;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 50;
  };
}
