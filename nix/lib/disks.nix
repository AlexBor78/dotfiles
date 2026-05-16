# /nix/lib/disks.nix

# rec - to use recursive attrivutes
# (needed to call regular funcs in BL versions)
{ lib, ... }: rec {

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
  
  mkBtrfs = { device, comp }: {
    device = lib.mkForce device;
    fsType = "btrfs";
    options = [ "defaults" "noatime" "compress=${comp}" ];
  };

  mkSwap = device: {
    device = lib.mkForce device;
    priority = -1;
  };

	# by label versions
  mkExt4BL = label: mkExt4 "/dev/disk/by-label/${label}";
  mkFatBL = label: mkFat "/dev/disk/by-label/${label}";
  mkBtrfsBL = { label, comp }: mkBtrfs { device="/dev/disk/by-label/${label}"; inherit comp; };
  mkSwapBL = label: mkSwap "/dev/disk/by-label/${label}";
}

