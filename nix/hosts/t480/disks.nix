# /nix/hosts/x13/disks.nix

{ lexalib, ... }: {
  
  fileSystems = {
    "/" =     lexalib.disks.mkExt4BL	"nixos_root";
    "/boot" = lexalib.disks.mkFatBL   "boot";
    "/home" = lexalib.disks.mkBtrfs 	{ device = "/dev/laptop/shared_home"; comp = "zstd:3"; };
		"/data" = lexalib.disks.mkBtrfsBL { label = "data"; comp = "zstd:3"; }; # even have data
  };

  swapDevices = [ (lexalib.disks.mkSwapBL "swap") ] ;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 50;
  };
}
