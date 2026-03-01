# /nix/moduels/common/disks.nix

{ lib,  ... }: 
let    
  mkExt4 = device: {
    device = lib.mkForce device;
    fsType = "ext4";
    options = [ "defaults" "noatime" ];
  };
  
  mkFat = device: {
    device = lib.mkForce device;
    fsType = "vfat";
    options = [ "defaults" "noatime" ];
  };
  
  mkBtrfs = device: {
    device = lib.mkForce device;
    fsType = "btrfs";
    options = [ "defaults" "noatime" "compress=zstd" ];
  };

  mkSwap = device: {
    device = lib.mkForce device;
    priority = -1;
  };

in {
  
  fileSystems = {
    "/" =     mkExt4  "/dev/laptop/nixos_root";
    "/boot" = mkFat   "/dev/disk/by-label/boot";
    "/home" = mkBtrfs "/dev/laptop/nixos_home";
  };

  swapDevices = [ (mkSwap "/dev/disk/by-label/swap") ] ;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 100;
    memoryPercent = 50;
  };
}
