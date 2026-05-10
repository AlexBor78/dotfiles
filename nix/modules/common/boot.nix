# /nix/modules/common/boot.nix

{ config, lib, pkgs, ...} : {
	
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
#      useOSProber = true;
			extraEntries = ''
			  menuentry "Arch Linux" {
			    insmod part_gpt
			    insmod fat
			    search --no-floppy --fs-uuid --set=root CC55-BFC7
			    linux /vmlinuz-linux root=/dev/mapper/laptop-arch rw
			    initrd /initramfs-linux.img
			  }
			'';
    };
  };

  boot.kernelParams = [
		# enable amd_pstate
    "nohz_idle=on"
    "processor.ignore_ppc=1"
    "acpi_cpufreq.enable_pcc=false"
    "amd_pstate=disable"

		# enable zswap (zram)
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=20"
    "zswap.zpool=z3fold" 
  ];
}
